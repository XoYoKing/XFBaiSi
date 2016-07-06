//
//  XFTopic.h
//  XFBaisi
//
//  Created by xiaofans on 16/6/29.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XFComment, XFImage, XFUser, XFGif, XFVideo, XFAudio;

@interface XFTopic : NSObject

/** 帖子 id */
@property (nonatomic, copy)   NSString  *ID;
/** 帖子的文字内容 */
@property (nonatomic, copy)   NSString  *text;
/** 帖子审核通过的时间 */
@property (nonatomic, copy)   NSString  *passtime;
/** 顶数量 */
@property (nonatomic, assign) NSInteger up;
/** 踩数量 */
@property (nonatomic, assign) NSInteger down;
/** 转发\分享数量 */
@property (nonatomic, assign) NSInteger forward;
/** 评论数量 */
@property (nonatomic, assign) NSInteger comment;
/** 用户信息 */
@property (nonatomic, strong) XFUser    *user;
/** 最热评论 */
@property (nonatomic, strong) XFComment *top_comment;
/** 图片 */
@property (nonatomic, strong) XFImage   *image;
/**  GIF 图片 */
@property (nonatomic, strong) XFGif     *gif;
/** 视频 */
@property (nonatomic, strong) XFVideo   *video;
/** 音频 */
@property (nonatomic, strong) XFAudio   *audio;

/** 帖子类型 */
@property (nonatomic, copy)   NSString  *type;
/** cell 高度 */
@property (nonatomic, assign) CGFloat   cellHeight;
/** 中间内容 frame */
@property (nonatomic, assign) CGRect    contentFrame;

/** 中间是否为超长大图 */
@property (nonatomic, assign, getter=isBigPicture) BOOL bigPicture;



@end













