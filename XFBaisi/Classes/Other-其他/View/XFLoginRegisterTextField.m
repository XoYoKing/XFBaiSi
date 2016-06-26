//
//  XFLoginRegisterTextField.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/26.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFLoginRegisterTextField.h"



@interface XFLoginRegisterTextField ()<UITextFieldDelegate>

@end

@implementation XFLoginRegisterTextField

static NSString * const XFPlaceholderColorKey = @"_placeholderLabel.textColor";


- (void)awakeFromNib {
    // 设置光标颜色
    self.tintColor = [UIColor whiteColor];
    
    // 设置默认的占位文字颜色
    [self setValue:[UIColor grayColor] forKeyPath:XFPlaceholderColorKey];
    
    self.delegate = self;
}

#pragma mark - <UITextFieldDelegate>

/**
 *  TextField 开始编辑
 */
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    XFLogFunc;
    [self setValue:[UIColor whiteColor] forKeyPath:XFPlaceholderColorKey];
}

/**
 *  TextField 结束编辑
 */
- (void)textFieldDidEndEditing:(UITextField *)textField {
    XFLogFunc;
    [self setValue:[UIColor grayColor] forKeyPath:XFPlaceholderColorKey];
}




@end
