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

@interface XFTopicPictureView ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *gifView;
@property (weak, nonatomic) IBOutlet UIButton *seeBigButton;
@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView *progressView;


@end

@implementation XFTopicPictureView

- (void)awakeFromNib {
    // 取消 xib 自动拉升宽高
    self.autoresizingMask = UIViewAutoresizingNone;
    
    //self.progressView.roundedCorners = 5;
    //self.progressView.progressLabel.textColor = [UIColor whiteColor];
    
    
}

- (void)setTopic:(XFTopic *)topic {
    _topic = topic;
    
    // gif
    self.gifView.hidden = !topic.is_gif;
    
    // 点击查看大图按钮
    self.seeBigButton.hidden = !topic.isBigPicture;
    if (topic.isBigPicture) {
        self.seeBigButton.hidden = NO;
        
        // 取消拉伸图片
        self.imageView.contentMode = UIViewContentModeTop;
        self.imageView.clipsToBounds = YES;
        
    } else {
        self.seeBigButton.hidden = YES;
        
        self.imageView.contentMode = UIViewContentModeScaleToFill;
        self.imageView.clipsToBounds = NO;
    }
    
    // 真机判断网络状态显示不同图片
    /*
    AFNetworkReachabilityStatus status = [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus;
    switch (status) {
        case AFNetworkReachabilityStatusReachableViaWWAN:   // 手机网络
            [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.small_image]];
            break;
        case AFNetworkReachabilityStatusReachableViaWiFi:   // WiFi
            [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];
            break;
        default:                                            // 没有网络
            self.imageView.image = nil;
            break;
    }
     */
    self.progressView.hidden = YES;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];
    //[self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        //CGFloat progress = 1.0 * receivedSize / expectedSize;
        //self.progressView.progress = progress;
        //self.progressView.hidden = NO;
        //self.progressView.backgroundColor = XFRandomColor;
        
        //self.progressView.progressLabel.text = [NSString stringWithFormat:@"%.0f%%", progress * 100];
        ////self.progressView.progressLabel.backgroundColor = XFRandomColor;
        
    //} completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        ////self.progressView.hidden = YES;
    //}];
    
}


#pragma mark - 监听按钮点击
- (IBAction)seeBigBtnClick:(UIButton *)sender {
    XFLogFunc
}

@end












