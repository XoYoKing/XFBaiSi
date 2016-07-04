//
//  XFFollowViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFFollowViewController.h"
#import "XFRecommendViewController.h"
#import "XFLoginRegisterViewController.h"

@interface XFFollowViewController ()

@end

@implementation XFFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = XFBaseBgColor;
   
    self.navigationItem.title = @"关注";
    
    // 左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem xf_itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(followClick)];
    
}

#pragma mark - 监听导航左边按钮
- (void)followClick {
    XFRecommendViewController *followVC = [[XFRecommendViewController alloc] init];
    [self.navigationController pushViewController:followVC animated:YES];
}

#pragma mark - 监听登录注册按钮
- (IBAction)loginRegisterAction {
    XFLoginRegisterViewController *loginRegisterVC = [[XFLoginRegisterViewController alloc] init];
    [self presentViewController:loginRegisterVC animated:YES completion:nil];
}


@end








