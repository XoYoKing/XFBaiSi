//
//  XFTopicAudioView.m
//  XFBaisi
//
//  Created by xiaofans on 16/7/6.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFTopicAudioView.h"
#import "XFTopic.h"
#import "XFAudio.h"

@interface XFTopicAudioView ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *audioTimeLabel;


@end

@implementation XFTopicAudioView

- (void)awakeFromNib {
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (void)setTopic:(XFTopic *)topic {
    _topic = topic;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.audio.thumbnail.firstObject]];
    self.playCountLabel.text = [NSString stringWithFormat:@"%zd播放", topic.audio.playcount];
    
    NSInteger minute = topic.audio.duration / 60;
    NSInteger second = topic.audio.duration % 60;
    
    self.audioTimeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd", minute, second];
    
    //self.imageView.image = [UIImage imageNamed:@"Login_bg"];
    //self.playCountLabel.text = @"7676播放";
    
    //self.audioTimeLabel.text = @"09:35";
    
    
}


- (IBAction)playButtonClick:(UIButton *)sender {
    XFLog(@"playButton");
}

@end
