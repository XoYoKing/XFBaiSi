//
//  XFConst.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/26.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <UIKit/UIKit.h>


/** 通用的间距值 */
CGFloat const XFMargin           = 10;
/** 通用的小间距值 */
CGFloat const XFSmallMargin      = XFMargin * 0.5;

/**  帖子类型- 图片 */
NSString * const XFTopicImage    = @"image";
/**  帖子类型- GIF */
NSString * const XFTopicGif      = @"gif";
/**  帖子类型-  视频 */
NSString * const XFTopicVideo    = @"video";
/**  帖子类型- 音频 */
NSString * const XFTopicAudio    = @"audio";
/**  帖子类型- 段子 */
NSString * const XFTopicWord     = @"word";

/** 用户性别- m */
NSString * const XFUserSexMale   = @"m";

/** 用户性别- f */
NSString * const XFUserSexFemale = @"f";


/*** 通知 ***/
/** TabBar按钮被重复点击的通知 */
NSString * const XFTabBarButtonDidRepeatClickNotification = @"XFTabBarButtonDidRepeatClickNotification";
/** 标题按钮被重复点击的通知 */
NSString * const XFTitleButtonDidRepeatClickNotification = @"XFTitleButtonDidRepeatClickNotification";




















