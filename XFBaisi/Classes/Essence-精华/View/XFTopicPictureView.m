//
//  XFTopicPictureView.m
//  XFBaisi
//
//  Created by xiaofans on 16/7/1.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFTopicPictureView.h"
#import "XFTopic.h"
#import "DALabeledCircularProgressView.h"
#import "XFImage.h"
#import "XFGif.h"
#import "XFSeeBigViewController.h"

@interface XFTopicPictureView ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *gifView;
@property (weak, nonatomic) IBOutlet UIButton    *seeBigButton;


@end

@implementation XFTopicPictureView

- (void)awakeFromNib {
    // 取消 xib 自动拉升宽高
    self.autoresizingMask = UIViewAutoresizingNone;
    
    self.imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(seeBigBtnClick:)];
    [self.imageView addGestureRecognizer:tapGR];
    
    
    
}

- (void)setTopic:(XFTopic *)topic {
    _topic = topic;
    
    // 点击查看大图按钮
    self.seeBigButton.hidden         = !topic.isBigPicture;
    if (topic.isBigPicture) {
        self.seeBigButton.hidden     = NO;
        
        // 取消拉伸图片
        self.imageView.contentMode   = UIViewContentModeTop;
        self.imageView.clipsToBounds = YES;
        
    } else {
        self.seeBigButton.hidden     = YES;
        
        self.imageView.contentMode   = UIViewContentModeScaleToFill;
        self.imageView.clipsToBounds = NO;
    }
    
    if ([topic.type isEqualToString:XFTopicImage]) {
        self.gifView.hidden = YES;
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.image.big.firstObject]];
    } else if ([topic.type isEqualToString:XFTopicGif]) {
        self.gifView.hidden = NO;
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.gif.images.firstObject]];
    }
}

@end












