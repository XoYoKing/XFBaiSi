//
//  UITextField+XFExtension.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/26.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "UITextField+XFExtension.h"

static NSString * const XFPlaceholderColorKey = @"_placeholderLabel.textColor";

@implementation UITextField (XFExtension)

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    
    // 先设置占位文字，可以提前创建placeholderLabel
    NSString *oldPlaceholder = self.placeholder;
    self.placeholder = @" ";
    self.placeholder = oldPlaceholder;
    
    // 恢复到默认的占位文字颜色
    if (placeholderColor == nil) {
        placeholderColor = [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
    }
    
    // 设置占位文字颜色
    [self setValue:placeholderColor forKeyPath:XFPlaceholderColorKey];
    
}

- (UIColor *)placeholderColor
{
    return [self valueForKeyPath:XFPlaceholderColorKey];
}

@end


















