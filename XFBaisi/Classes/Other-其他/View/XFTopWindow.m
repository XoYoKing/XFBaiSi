//
//  XFTopWindow.m
//  XFBaisi
//
//  Created by xiaofans on 16/7/7.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFTopWindow.h"

@implementation XFTopWindow

// 声明为私有全局变量
static UIWindow *window_;

+ (void)xf_showTopWindow {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        window_ = [[UIWindow alloc] init];
        window_.frame = [UIApplication sharedApplication].statusBarFrame;
        window_.backgroundColor = [UIColor clearColor];
        window_.windowLevel = UIWindowLevelAlert;
        window_.hidden = NO;
        [window_ addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(topWindowClick)] ];
    });
}


/**
 *  点击状态栏tableview回滚到顶部
 */
+ (void)topWindowClick {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    // 查找主窗口中所有的 scrollview
    [self findScrollViewInView:window];
}

+ (void)findScrollViewInView:(UIView *)view {
    // 利用递归查找所有子控件
    for (UIView *subview in view.subviews) {
        [self findScrollViewInView:subview];
    }
    // 不是scrollView
    if (![view isKindOfClass:[UIScrollView class]]) return;
    
    // 是 scrollView
    UIScrollView *scrollView = (UIScrollView *)view;
    
    // 判断是否是当前界面的 scrollView
    CGRect windowRect = [UIApplication sharedApplication].keyWindow.bounds;
    CGRect viewRect = [view convertRect:view.bounds toView:nil];
    
    if (!CGRectIntersectsRect(windowRect, viewRect)) return;
    
    // 修改 offset
    CGPoint offset = scrollView.contentOffset;
    offset.y       = - scrollView.contentInset.top;
    [scrollView setContentOffset:offset animated:YES];
    
}


@end
