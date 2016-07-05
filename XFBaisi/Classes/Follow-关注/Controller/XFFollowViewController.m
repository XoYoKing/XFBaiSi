//
//  XFFollowViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFFollowViewController.h"
#import "XFLoginRegisterViewController.h"

@interface XFFollowViewController ()

@end

@implementation XFFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = XFBaseBgColor;
    
    
}

#pragma mark - 监听登录注册按钮
- (IBAction)loginRegisterAction {
    XFLoginRegisterViewController *loginRegisterVC = [[XFLoginRegisterViewController alloc] init];
    [self presentViewController:loginRegisterVC animated:YES completion:nil];
}


@end








