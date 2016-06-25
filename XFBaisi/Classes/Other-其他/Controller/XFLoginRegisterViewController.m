//
//  XFLoginRegisterViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFLoginRegisterViewController.h"

@interface XFLoginRegisterViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMargin;
@end

@implementation XFLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

}

/**
 *  关闭当前界面
 */
- (IBAction)closeBtn {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  显示登录或者注册界面按钮
 */
- (IBAction)showLoginOrRegister:(UIButton *)button {
    
    // 关闭键盘
    [self.view endEditing:YES];
    
    // 设置约束和按钮状态
    if (self.leftMargin.constant) { // 目前是注册界面,点击按钮后切换为登录界面
        self.leftMargin.constant = 0;
        button.selected = NO;
        //[button setTitle:@"注册帐号" forState:UIControlStateNormal];
    } else {                        // 目前是登录界面,点击按钮后切换为注册界面
        self.leftMargin.constant = (- self.view.xf_width);
        button.selected = YES;
        //[button setTitle:@"已有帐号？" forState:UIControlStateNormal];
    }
    
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];     // 强制刷新代码
    }];
}

/**
 *  显示登录注册界面时状态栏是白色的
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end












