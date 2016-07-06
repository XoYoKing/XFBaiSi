//
//  XFTopic.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/29.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFTopic.h"
#import "XFComment.h"
#import "XFUser.h"
#import "XFImage.h"
#import "XFGif.h"
#import "XFVideo.h"
#import "XFAudio.h"



@implementation XFTopic

#pragma mark - cell 高度
- (CGFloat)cellHeight {
    // 如果已经计算好 cell 高度，就直接返回
    if (_cellHeight) return _cellHeight;
    
    // 头像
    _cellHeight = 55;
    
    // 文字
    CGFloat textMaxW = SCREEN.width - 2 * XFMargin;
    CGSize textMaxSize = CGSizeMake(textMaxW, MAXFLOAT);
    CGSize textSize = [self.text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size;
    _cellHeight += textSize.height + XFMargin;
    
    // 中间的内容
    if ([self.type isEqualToString:@"image"]) { // 图片视频算中间内容
        // 中间图片真是宽度 * 图片真是高度 / 图片真是宽度
        CGFloat contentH = textMaxW * self.image.height / self.image.width;
        
        if (contentH > SCREEN.height) {
            contentH = 300;
            self.bigPicture = YES;
        }
        self.contentFrame = CGRectMake(XFMargin, _cellHeight, textMaxW, contentH);
        _cellHeight += contentH + XFMargin;
    } else if ([self.type isEqualToString:@"gif"]) {
        CGFloat contentH = textMaxW * self.gif.height / self.gif.width;
        
        self.contentFrame = CGRectMake(XFMargin, _cellHeight, textMaxW, contentH);
        _cellHeight += contentH + XFMargin;
    } else if ([self.type isEqualToString:@"video"]) {
        CGFloat contentH = textMaxW * self.video.height / self.video.width;
        
        self.contentFrame = CGRectMake(XFMargin, _cellHeight, textMaxW, contentH);
        _cellHeight += contentH + XFMargin;
    } else if ([self.type isEqualToString:@"audio"]) {
        CGFloat contentH = textMaxW * self.audio.height / self.audio.width;
        
        self.contentFrame = CGRectMake(XFMargin, _cellHeight, textMaxW, contentH);
        _cellHeight += contentH + XFMargin;
    }
    
    // 最热评论
    if (self.top_comment) {
        // 最热评论标题
        _cellHeight += 20;
        // 最热评论内容
        NSString *topCmtConernt = [NSString stringWithFormat:@"%@ : %@", self.top_comment.user.name, self.top_comment.content];
        CGSize tocCmtContentSize = [topCmtConernt boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size;
        _cellHeight += tocCmtContentSize.height + XFMargin;
    }
    
    // 底部工具条
    _cellHeight += 35 + XFMargin;
    
    return _cellHeight;
}

@end



















