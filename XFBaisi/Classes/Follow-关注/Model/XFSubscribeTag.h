//
//  XFSubscribe.h
//  XFBaisi
//
//  Created by xiaofans on 16/7/5.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XFSubscribeTag : NSObject

/** name */
@property (nonatomic, copy)   NSString  *theme_name;
/** iconurl */
@property (nonatomic, copy)   NSString  *image_list;
/** 详情图片 */
@property (nonatomic, copy)   NSString  *image_detail;
/** 订阅数 */
@property (nonatomic, assign) NSInteger sub_number;
/** 总帖数 */
@property (nonatomic, assign) NSInteger post_num;

@end


