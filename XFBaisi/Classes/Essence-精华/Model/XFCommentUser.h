//
//  XFCommentUser.h
//  XFBaisi
//
//  Created by xiaofans on 16/7/6.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XFCommentUser : NSObject

/** 评论界面数据 */
/** username */
@property (nonatomic, copy) NSString *username;
/** 性别 */
@property (nonatomic, copy) NSString *sex;
/** 头像 */
@property (nonatomic, copy) NSString *profile_image;

@end
