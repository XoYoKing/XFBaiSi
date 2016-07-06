//
//  XFCommentCell.m
//  XFBaisi
//
//  Created by xiaofans on 16/7/6.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFCommentCell.h"
#import "XFComment.h"
#import "XFUser.h"
#import "XFCommentUser.h"

@interface XFCommentCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIImageView *sexView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *voiceButton;



@end

@implementation XFCommentCell


- (void)awakeFromNib {
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}

- (void)setCommetn:(XFComment *)comment {
    _commetn = comment;
    
    self.nameLabel.text = comment.comUser.username;
    self.contentLabel.text = comment.content;
    self.likeCountLabel.text = [NSString stringWithFormat:@"%zd", comment.like_count];
    [self.iconView xf_setHeader:comment.comUser.profile_image];
    
    NSString *sexImageName = [comment.comUser.sex isEqualToString:XFUserSexMale] ? @"Profile_manIcon" : @"Profile_womanIcon";
    self.sexView.image = [UIImage imageNamed:sexImageName];
    
    if (comment.voiceuri.length) {
        self.voiceButton.hidden = NO;
        [self.voiceButton setTitle:[NSString stringWithFormat:@"%zd''", comment.voicetime] forState:UIControlStateNormal];
    } else {
        self.voiceButton.hidden = YES;
    }
}


- (IBAction)likeButtonClick:(UIButton *)sender {
    XFLog(@"给评论点赞");
}

@end












