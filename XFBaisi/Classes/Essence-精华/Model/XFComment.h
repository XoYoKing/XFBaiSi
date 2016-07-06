//
//  XFComment.h
//  XFBaisi
//
//  Created by xiaofans on 16/6/30.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XFUser, XFCommentUser;

@interface XFComment : NSObject
/** 最后一条评论 id */
@property (nonatomic, copy) NSString *ID;
/** 评论内容 */
@property (nonatomic, copy) NSString *content;
/** 帖子界面的用户数据 */
@property (nonatomic, strong) XFUser *user;

/** 评论里的用户数据 */
@property (nonatomic, strong) XFCommentUser *comUser;

/** 点赞数 */
@property (nonatomic, assign) NSInteger like_count;
/** 音频评论时长 */
@property (nonatomic, assign) NSInteger voicetime;
/** 音频评论路径 */
@property (nonatomic, copy) NSString *voiceuri;

@end
