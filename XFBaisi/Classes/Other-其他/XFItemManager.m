//
//  XFItemManager.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFItemManager.h"

@implementation XFItemManager

+ (UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
