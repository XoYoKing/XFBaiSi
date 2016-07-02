//
//  XFTopicVideoView.m
//  XFBaisi
//
//  Created by xiaofans on 16/7/1.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFTopicVideoView.h"
#import "XFTopic.h"
#import "XFVideo.h"

@interface XFTopicVideoView ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *videoTimeLabel;


@end

@implementation XFTopicVideoView

- (void)awakeFromNib {
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (void)setTopic:(XFTopic *)topic {
    _topic = topic;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.video.thumbnail.firstObject]];
    
    self.playCountLabel.text = [NSString stringWithFormat:@"%zd播放", topic.video.playcount];
    
    NSInteger minute = topic.video.duration / 60;
    NSInteger second = topic.video.duration % 60;
    
    self.videoTimeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd", minute, second];
}

#pragma mark - 监听按钮点击
- (IBAction)playButtonClick:(UIButton *)sender {
    XFLogFunc
}

@end










