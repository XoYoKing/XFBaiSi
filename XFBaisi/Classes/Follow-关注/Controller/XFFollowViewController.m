//
//  XFFollowViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFFollowViewController.h"
#import "XFRecommendViewController.h"

@interface XFFollowViewController ()

@end

@implementation XFFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = XFBaseBgColor;
   
    self.navigationItem.title = @"我的关注";
    
    // 左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(followClick)];
    
}

#pragma mark - 监听导航左边按钮
- (void)followClick {
    XFLogFunc;
    XFRecommendViewController *recoVC = [[XFRecommendViewController alloc] init];
    recoVC.view.backgroundColor = XFRandomColor;
    [self.navigationController pushViewController:recoVC animated:YES];
}



@end








