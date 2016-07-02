//
//  XFImage.h
//  XFBaisi
//
//  Created by xiaofans on 16/7/2.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XFImage : NSObject

@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;     

/**  三种图片尺寸数组 */
@property (nonatomic, strong) NSArray *big;
@property (nonatomic, strong) NSArray *medium;
@property (nonatomic, strong) NSArray *small;



@end
