//
//  XFEssenceViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFEssenceViewController.h"
#import "XFTitleButton.h"

@interface XFEssenceViewController ()

// 当前选中的标题按钮
@property (nonatomic, weak) XFTitleButton *selectedTitleBtn;

// 标题按钮底部指示器
@property (nonatomic, weak) UIView *indicatorView;

@end

@implementation XFEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    
    [self setupScrollView];
    
    [self setupTitleView];
}

#pragma mark - 初始化

/**
 *  创建导航栏
 */
- (void)setupNav {
    
    self.view.backgroundColor = XFBaseBgColor;
    
    // 顶部标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    // 左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
}

/**
 *  创建 滚动视图
 */
- (void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = XFBaseBgColor;
    scrollView.frame = self.view.bounds;
    
    [self.view addSubview:scrollView];
}

/**
 *  创建 顶部标题栏
 */
- (void)setupTitleView {
    UIView *titleView = [[UIView alloc] init];
    titleView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.2];
    titleView.frame = CGRectMake(0, 64, self.view.xf_width, 35);
    [self.view addSubview:titleView];
    
    // 添加按钮
    NSArray *titlesArray = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    NSInteger count = titlesArray.count;
    CGFloat titleBtnW = titleView.xf_width / count;
    CGFloat titleBtnH = titleView.xf_height;
    
    for (NSUInteger i = 0; i < count; i++) {
        XFTitleButton *titleBtn = [XFTitleButton buttonWithType:UIButtonTypeCustom];
        [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:titleBtn];
        
        // 设置数据
        [titleBtn setTitle:titlesArray[i] forState:UIControlStateNormal];
        
        // 设置 frame
        titleBtn.frame = CGRectMake(i * titleBtnW, 0, titleBtnW, titleBtnH);
    }
    
    // 按钮的选中颜色
    XFTitleButton *firstTitleButton = titleView.subviews.firstObject;
    
    // 底部选中指示器
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [firstTitleButton titleColorForState:UIControlStateSelected];
    indicatorView.xf_height = 1;
    indicatorView.xf_y = titleView.xf_height - indicatorView.xf_height;
    [titleView addSubview:indicatorView];
    self.indicatorView = indicatorView;
    
    // 立即根据文字内容计算 label 的宽度
    [firstTitleButton.titleLabel sizeToFit];
    indicatorView.xf_width = firstTitleButton.titleLabel.xf_width;
    indicatorView.xf_centerX = firstTitleButton.xf_centerX;
    
    // 默认选中最前面的按钮
    firstTitleButton.selected = YES;
    self.selectedTitleBtn = firstTitleButton;
    
}

#pragma mark - 监听按钮点击

/**
 *  顶部标题按钮点击事件
 */
- (void)titleClick:(XFTitleButton *)titleButton {
    // 控制按钮状态
    self.selectedTitleBtn.selected = NO;
    titleButton.selected = YES;
    self.selectedTitleBtn = titleButton;
    
    // 指示器
    [UIView animateWithDuration:0.25 animations:^{
        
        self.indicatorView.xf_width = titleButton.titleLabel.xf_width;
        self.indicatorView.xf_centerX = titleButton.xf_centerX;
    }];
    
    
}

/**
 *  导航栏左边按钮点击事件
 */
- (void)tagClick {
    XFLogFunc;
}


@end

















