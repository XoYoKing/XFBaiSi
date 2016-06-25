//
//  XFMeViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFMeViewController.h"
#import "XFSettingViewController.h"

@interface XFMeViewController ()

@end

@implementation XFMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = XFBaseBgColor;
    self.navigationItem.title = @"我";
    
    // 右边 - 设置
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    
    // 右边 - 月亮
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
    
}

#pragma mark - 监听导航按钮
- (void)settingClick {
    XFSettingViewController *settingVC = [[XFSettingViewController alloc] init];
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)moonClick {
    XFLogFunc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
