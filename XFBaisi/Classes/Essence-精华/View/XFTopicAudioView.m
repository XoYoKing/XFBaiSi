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
#import <AVFoundation/AVFoundation.h>

@interface XFTopicAudioView ()<AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel     *playCountLabel;
@property (weak, nonatomic) IBOutlet UILabel     *audioTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *playButton;


/**  音频播放器 */
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
/** flag */
@property (nonatomic, assign) BOOL flag;


@end

@implementation XFTopicAudioView

//- (AVAudioPlayer *)audioPlayer {
    //if (!_audioPlayer) {
        //_audioPlayer = [[AVAudioPlayer alloc] init];
    //}
    //return _audioPlayer;
//}

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
}

- (AVAudioPlayer *)audioPlayer {
    if (!_audioPlayer) {
        _audioPlayer = [[AVAudioPlayer alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.topic.audio.audio.firstObject]] error:nil];
        //_audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:self.topic.audio.audio.firstObject] error:nil];
        _audioPlayer.delegate = self;

    }
    return _audioPlayer;
}



- (IBAction)playButtonClick:(UIButton *)sender {
    
    if (!self.flag) {
        [self.audioPlayer play];
        [sender setImage:[UIImage imageNamed:@"playButtonPause"] forState:UIControlStateNormal];
        self.flag = YES;
    } else {
        [self.audioPlayer stop];
        [sender setImage:[UIImage imageNamed:@"playButtonPlay"] forState:UIControlStateNormal];
        self.flag = NO;
    }
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    [self.playButton setImage:[UIImage imageNamed:@"playButtonPlay"] forState:UIControlStateNormal];
    self.flag = NO;
}

@end














