//
//  XFabBarController.m
//  XFBaiSi
//
//  Created by xiaofans on 16/6/24.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFTabBarController.h"
#import "XFTabBar.h"
#import "XFEssenceViewController.h"
#import "XFNewViewController.h"
#import "XFFollowViewController.h"
#import "XFMeViewController.h"
#import "XFNavigationController.h"


#define TabBar_Width 
#define TabBar_Height

@interface XFTabBarController ()

@end

@implementation XFTabBarController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**** 统一设置底部 UITabBarItem 的文字属性 ****/
    [self setupItemTitleTextAtttributes];
    
    /**** 添加子控制器 ****/
    [self setupChildViewController];
    
     /**** 更换 tabBar ****/
    [self setupTabBar];
    
    
}


#pragma mark - 初始化

/**
 *  设置 tabBar 文字属性
 */
- (void)setupItemTitleTextAtttributes {
    UITabBarItem *item = [UITabBarItem appearance];
    
    // 普通状态
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    
    // 选中状态
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:selectedAttrs forState:UIAccessibilityTraitSelected];
}

/**
 *  添加子控制器
 */
- (void)setupChildViewController {
    
    [self setupOneChildViewController:[[XFNavigationController alloc] initWithRootViewController:[[XFFollowViewController alloc] init]] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    [self setupOneChildViewController:[[XFNavigationController alloc] initWithRootViewController:[[XFEssenceViewController alloc] init]] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setupOneChildViewController:[[XFNavigationController alloc] initWithRootViewController:[[XFNewViewController alloc] init]] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    
    
    [self setupOneChildViewController:[[XFNavigationController alloc] initWithRootViewController:[[XFMeViewController alloc] init]] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
}

/**
 *  创建tabBar控制器
 */
- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    
    vc.tabBarItem.title = title;
    if (image.length) {
        vc.tabBarItem.image = [UIImage imageNamed:image];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    [self addChildViewController:vc];
    
}

/**
 *  设置 TabBar
 */
- (void)setupTabBar {
    [self setValue:[[XFTabBar alloc] init] forKey:@"tabBar"];
}



@end















