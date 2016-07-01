//
//  XFTopic.h
//  XFBaisi
//
//  Created by xiaofans on 16/6/29.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XFComment;

/**
 *  枚举 cell 中间内容类型
 */
typedef NS_ENUM(NSUInteger, XFTopicType) {
    /** 图片 */
    XFTopicTypePicture = 10,
    /** 段子 */
    XFTopicTypeWord = 29,
    /** 音频 */
    XFTopicTypeVoice = 31,
    /** 视频 */
    XFTopicTypeVideo = 41,
};

@interface XFTopic : NSObject

@property (nonatomic, copy)   NSString  *name;              // 用户的名字
@property (nonatomic, copy)   NSString  *profile_image;     // 用户的头像
@property (nonatomic, copy)   NSString  *text;              // 帖子的文字内容
@property (nonatomic, copy)   NSString  *created_at;        // 帖子审核通过的时间
@property (nonatomic, assign) NSInteger ding;               // 顶数量
@property (nonatomic, assign) NSInteger cai;                // 踩数量
@property (nonatomic, assign) NSInteger repost;             // 转发\分享数量
@property (nonatomic, assign) NSInteger comment;            // 评论数量

@property (nonatomic, strong) XFComment *top_cmt;           // 最热评论

@property (nonatomic, assign) XFTopicType type;             // 帖子类型

@property (nonatomic, assign) CGFloat cellHeight;           // cell 高度

@property (nonatomic, assign) CGFloat height;               // 图片 高度
@property (nonatomic, assign) CGFloat width;                // 图片 高度



@end













