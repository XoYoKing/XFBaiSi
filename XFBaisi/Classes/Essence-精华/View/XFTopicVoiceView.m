//
//  XFTopicVoiceView.m
//  XFBaisi
//
//  Created by xiaofans on 16/7/6.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFTopicVoiceView.h"
#import "XFTopic.h"
#import "XFAudio.h"

@interface XFTopicVoiceView ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *voiceTimeLabel;


@end

@implementation XFTopicVoiceView

- (void)awakeFromNib {
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (void)setTopic:(XFTopic *)topic {
    _topic = topic;
    XFLogFunc
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.audio.thumbnail.firstObject]];
    self.playCountLabel.text = [NSString stringWithFormat:@"%zd播放", topic.audio.playcount];
    
    NSInteger minute = topic.audio.duration / 60;
    NSInteger second = topic.audio.duration % 60;
    
    self.voiceTimeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd", minute, second];
}

- (IBAction)playButtonClick:(UIButton *)sender {
}

@end
