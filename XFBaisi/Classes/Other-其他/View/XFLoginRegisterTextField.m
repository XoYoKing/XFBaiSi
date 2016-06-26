//
//  XFLoginRegisterTextField.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/26.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFLoginRegisterTextField.h"
//#import <objc/runtime.h>

@implementation XFLoginRegisterTextField


static NSString * const XFPlaceholderColorKey = @"_placeholderLabel.textColor";

- (void)awakeFromNib {
    // 设置光标颜色
    self.tintColor = [UIColor whiteColor];
    
    // 利用运行时查看所有属性
    //unsigned int count;
    //Ivar *ivarList = class_copyIvarList([UITextField class], &count);
    //for (int i = 0; i < count; i++) {
        //Ivar ivar = ivarList[i];
        //XFLog(@"%s", ivar_getName(ivar));
    //}
    //free(ivarList);
    
    [self setValue:[UIColor grayColor] forKeyPath:XFPlaceholderColorKey];
}

#pragma mark - 重写
//- (void)drawPlaceholderInRect:(CGRect)rect {
    //// 设置占位文字颜色
    //NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    //attributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
    //attributes[NSFontAttributeName] = self.font;
    
    //CGPoint placeholderPoint = CGPointMake(0, (rect.size.height - self.font.lineHeight) * 0.5);
    //[self.placeholder drawAtPoint:placeholderPoint withAttributes:attributes];
    
//}



@end
