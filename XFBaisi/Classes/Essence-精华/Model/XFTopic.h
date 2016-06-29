//
//  XFTopic.h
//  XFBaisi
//
//  Created by xiaofans on 16/6/29.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XFTopic : NSObject

@property (nonatomic, copy)   NSString  *name;              // 用户的名字
@property (nonatomic, copy)   NSString  *profile_image;     // 用户的头像
@property (nonatomic, copy)   NSString  *text;              // 帖子的文字内容
@property (nonatomic, copy)   NSString  *created_at;        // 帖子审核通过的时间
@property (nonatomic, assign) NSInteger ding;               // 顶数量
@property (nonatomic, assign) NSInteger cai;                // 踩数量
@property (nonatomic, assign) NSInteger repost;             // 转发\分享数量
@property (nonatomic, assign) NSInteger comment;            // 评论数量

@end
