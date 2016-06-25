//
//  XFNavigationController.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFNavigationController.h"

@interface XFNavigationController ()

@end

@implementation XFNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = XFRandomColor;
}

/**
 *  重写 push 方法
 *
 *  @param viewController  push 进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    // 如果viewController不是最早push进来的子控制器才设置返回按钮
    if (self.childViewControllers.count > 0) {
        // 左上角按钮
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backButton sizeToFit];
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        
        // 隐藏底部的工具条
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    // 完成所有设置后才 push控制器
    [super pushViewController:viewController animated:animated];
}

#pragma mark - 监听返回按钮
- (void)backClick {
    [self popViewControllerAnimated:YES];
}

@end
















