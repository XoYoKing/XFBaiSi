//
//  UIView+XFExtension.h
//  XFBaiSi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XFExtension)
@property (nonatomic, assign) CGFloat xf_width;
@property (nonatomic, assign) CGFloat xf_height;
@property (nonatomic, assign) CGFloat xf_x;
@property (nonatomic, assign) CGFloat xf_y;
@property (nonatomic, assign) CGFloat xf_centerX;
@property (nonatomic, assign) CGFloat xf_centerY;

@property (nonatomic, assign) CGFloat xf_right;
@property (nonatomic, assign) CGFloat xf_bottom;

+ (instancetype)xf_viewFromXib;

@end
