//
//  XFTabBar.m
//  XFBaiSi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFTabBar.h"


@interface XFTabBar ()

@property (nonatomic, weak) UIButton *publishButton;      // 中间的发布按钮

@end

@implementation XFTabBar


/***  懒加载发布按钮 ***/
- (UIButton *)publishButton {
    if (!_publishButton) {
        UIButton * publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        _publishButton = publishButton;
    }
    return _publishButton;
}

#pragma mark - 初始化

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
    }
    return self;
}

/**
 *  布局子控件
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    
    /**** 设置按钮的尺寸 ****/
    CGFloat buttonW = self.xf_width / 5;
    CGFloat buttonH = self.xf_height;
    
    /**** 设置 UITabBarButton 的 frame ****/
    CGFloat tabBarButtonY = 0;
    // 按钮索引
    int tabBarButtonIndex = 0;
    
    for (UIView *subview in self.subviews) {
        // 过滤掉非 UITabBarButton
        if (subview.class != NSClassFromString(@"UITabBarButton")) continue;
        
        CGFloat tabBarButtonX = tabBarButtonIndex * buttonW;
        
        if (tabBarButtonIndex >= 2) {  // 右边两个按钮
            tabBarButtonX += buttonW;
        }
        subview.frame = CGRectMake(tabBarButtonX, tabBarButtonY, buttonW, buttonH);
        
        // 增加索引
        tabBarButtonIndex++;
    }
    
    /**** 中间按钮的frame ****/
    self.publishButton.xf_width     = buttonW;
    self.publishButton.xf_height    = buttonH;
    self.publishButton.xf_centerX   = self.xf_width * 0.5;
    self.publishButton.xf_centerY   = self.xf_height * 0.5;
}

#pragma mark - 监听发布按钮

- (void)publishClick {
    XFLogFunc
}


@end












