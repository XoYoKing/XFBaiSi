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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginEditing) name:UITextFieldTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endEditing) name:UITextFieldTextDidEndEditingNotification object:self];
}

#pragma mark - <UITextFieldDelegate>

/**
 *  TextField 开始编辑
 */
- (void)beginEditing {
    XFLogFunc;
    [self setValue:[UIColor whiteColor] forKeyPath:XFPlaceholderColorKey];
}

/**
 *  TextField 结束编辑
 */
- (void)endEditing {
    XFLogFunc;
    [self setValue:[UIColor grayColor] forKeyPath:XFPlaceholderColorKey];
}

/**
 *  移除通知中心
 */
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end
