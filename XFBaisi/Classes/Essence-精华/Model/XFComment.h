//
//  XFComment.h
//  XFBaisi
//
//  Created by xiaofans on 16/6/30.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XFTopCmtUser;

@interface XFComment : NSObject

@property (nonatomic, copy) NSString *content;      // 评论内容
@property (nonatomic, strong) XFTopCmtUser *u;         // 发表评论的用户

@end
