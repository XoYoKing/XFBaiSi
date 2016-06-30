//
//  XFTopicCell.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/29.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFTopicCell.h"
#import "XFTopic.h"
#import "XFComment.h"
#import "XFUser.h"


@interface XFTopicCell ()

@property (nonatomic, weak) IBOutlet UIImageView *profileImageView;  // 头像

@property (nonatomic, weak) IBOutlet UILabel     *nameLabel;         // 名字
@property (nonatomic, weak) IBOutlet UILabel     *createdAtLabel;    // 审核通过时间
@property (nonatomic, weak) IBOutlet UILabel     *text_label;        // 内容文字

@property (nonatomic, weak) IBOutlet UIButton    *dingButton;        // 顶 按钮
@property (nonatomic, weak) IBOutlet UIButton    *caiButton;         // 踩 按钮
@property (nonatomic, weak) IBOutlet UIButton    *repostButton;      // 转发/分享 按钮
@property (nonatomic, weak) IBOutlet UIButton    *commentButton;     // 评论按钮

@property (nonatomic, weak) IBOutlet UIView      *topCmtView;        // 最热评论整体 view
@property (nonatomic, weak) IBOutlet UILabel     *topCmtContentLabel;// 最热评论内容

@end

@implementation XFTopicCell

#pragma mark - XFTopicCell

- (void)awakeFromNib {
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}

- (void)setTopic:(XFTopic *)topic {
    _topic = topic;
    
    [self.profileImageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameLabel.text = topic.name;
    self.createdAtLabel.text = topic.created_at;
    self.text_label.text = topic.text;
    
    [self setupButton:self.dingButton number:topic.ding placeholder:@"顶"];
    [self setupButton:self.caiButton number:topic.cai placeholder:@"踩"];
    [self setupButton:self.repostButton number:topic.repost placeholder:@"分享"];
    [self setupButton:self.commentButton number:topic.comment placeholder:@"评论"];
    
#pragma mark - 是否显示最热评论
    if (topic.top_cmt) {    // 有
        self.topCmtView.hidden = NO;
        
        NSString *username = topic.top_cmt.user.username;
        NSString *content = topic.top_cmt.content;
        
        self.topCmtContentLabel.text = [NSString stringWithFormat:@"%@: %@", username, content];
        
    } else {                // 没有
        self.topCmtView.hidden = YES;
    }
    
#pragma mark - 处理 cell 中间的内容
    switch (topic.type) {
        case XFTopicTypePicture:    // 图片
        {
            
        }
            break;
        case XFTopicTypeWord:       // 段子
        {
            
        }
            break;
        case XFTopicTypeVoice:      // 音频
        {
            
        }
            break;
        case XFTopicTypeVideo:      // 视频
        {
            
        }
            break;
    }
    
    
}

/**
 *  设置按钮文字
 */
- (void)setupButton:(UIButton *)button number:(NSInteger)number placeholder:(NSString *)placeholder {
    if (number >= 10000) {
        [button setTitle:[NSString stringWithFormat:@"%.1f万", number / 10000.0] forState:UIControlStateNormal];
    } else if (number > 0) {
        [button setTitle:[NSString stringWithFormat:@"%zd", number] forState:UIControlStateNormal];
    } else {
        [button setTitle:placeholder forState:UIControlStateNormal];
    }
}

/**
 *  重写 setFrame 方法,拦截系统设置的 frame
 */
- (void)setFrame:(CGRect)frame {
    
    frame.size.height -= XFMargin;
    frame.origin.y += XFMargin;
    
    [super setFrame:frame];
}

#pragma mark - 按钮点击事件

- (IBAction)more {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [controller addAction:[UIAlertAction actionWithTitle:@"收藏" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        XFLog(@"点击了 --> 收藏");
    }]];
    
    [controller addAction:[UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        XFLog(@"点击了 --> 举报");
    }]];
    [controller addAction:[UIAlertAction actionWithTitle:@"取消" style: UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        XFLog(@"点击了 --> 取消");
    }]];
    
    [self.window.rootViewController presentViewController:controller animated:YES completion:nil];
}




@end






