//
//  XFRecommendViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFRecommendViewController.h"

@interface XFRecommendViewController ()

@end

@implementation XFRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = XFBaseBgColor;
    self.navigationItem.title = @"推荐关注";
    
    [self loadRecommendSub];
    
}

//
- (void)loadRecommendSub {
    [SVProgressHUD showWithStatus:@"加载中..."];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    // 测试
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [SVProgressHUD dismiss];
    });
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [SVProgressHUD dismiss];
}



@end












