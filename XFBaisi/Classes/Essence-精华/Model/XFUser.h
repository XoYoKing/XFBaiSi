//
//  XFUser.h
//  XFBaisi
//
//  Created by xiaofans on 16/6/30.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XFUser : NSObject

/** 名字 */
@property (nonatomic, copy) NSString *name;
/** 是否 vip */
@property (nonatomic, assign) BOOL is_vip;

/** 帖子列表界面数据 */
/** 用户头像数组 */
@property (nonatomic, strong) NSArray *header;




@end
