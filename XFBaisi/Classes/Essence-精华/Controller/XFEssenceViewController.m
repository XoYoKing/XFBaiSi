//
//  XFEssenceViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFEssenceViewController.h"

@interface XFEssenceViewController ()

@end

@implementation XFEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = XFBaseBgColor;
    
    // 顶部标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    // 左边
    self.navigationItem.leftBarButtonItem = [XFItemManager itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
}

#pragma mark - 监听导航左边按钮
- (void)tagClick {
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
