//
//  XFEssenceViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFEssenceViewController.h"
#import "XFTitleButton.h"
#import "XFRecomViewController.h"
#import "XFVideoViewController.h"
#import "XFWangHotViewController.h"
#import "XFPictureViewController.h"
#import "XFWordViewController.h"
#import "XFPaiHangViewController.h"
#import "XFSheHuiViewController.h"
#import "XFBeautyViewController.h"

@interface XFEssenceViewController () <UIScrollViewDelegate>

/** 当前选中的标题按钮 */
@property (nonatomic, weak) XFTitleButton *selectedTitleBtn;
/** 标题按钮底部指示器 */
@property (nonatomic, weak) UIView        *indicatorView;
/** 滚动视图 */
@property (nonatomic, weak) UIScrollView  *scrollView;
/** 顶部标题栏 */
@property (nonatomic, weak) UIView        *titleView;

/** 滚动titleSView */
@property (nonatomic, weak) UIScrollView  *titleSView;


@end
 
@implementation XFEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    
    [self setupChildViewControllers];
    
    [self setupScrollView];
    
    [self setupTitleView];
    
    [self addChildVcView];
}

#pragma mark - 初始化

- (void)setupChildViewControllers {
    XFRecomViewController   *recomView      = [[XFRecomViewController alloc] init];
    [self addChildViewController:recomView];
    
    XFVideoViewController   *videoView      = [[XFVideoViewController alloc] init];
    [self addChildViewController:videoView];
    
    XFPictureViewController *pictureView    = [[XFPictureViewController alloc] init];
    [self addChildViewController:pictureView];
    
    XFWordViewController    *wordView       = [[XFWordViewController alloc] init];
    [self addChildViewController:wordView];
    
    XFWangHotViewController *wangHotView    = [[XFWangHotViewController alloc] init];
    [self addChildViewController:wangHotView];
    
    XFPaiHangViewController *paiHangView    = [[XFPaiHangViewController alloc] init];
    [self addChildViewController:paiHangView];
    
    XFSheHuiViewController  *sheHuiView     = [[XFSheHuiViewController alloc] init];
    [self addChildViewController:sheHuiView];
    
    XFBeautyViewController  *beautView      = [[XFBeautyViewController alloc] init];
    [self addChildViewController:beautView];
}

/**
 *  创建导航栏
 */
- (void)setupNav {
    
    self.view.backgroundColor = XFBaseBgColor;
    
    // 顶部标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    // 右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem xf_itemWithImage:@"nav_btn" highImage:@"nav_btn_click" target:self action:@selector(tagClick)];
    
}

/**
 *  创建 滚动视图
 */
- (void)setupScrollView {
    // 不允许自动调整 view 的内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = XFBaseBgColor;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.frame = self.view.bounds;
    scrollView.delegate = self;
    scrollView.scrollEnabled = NO;
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * scrollView.xf_width, 0);
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
}

/**
 *  创建 顶部标题栏
 */
- (void)setupTitleView {
    
    UIScrollView *titleSView = [[UIScrollView alloc] init];
    titleSView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"]];
    titleSView.frame = CGRectMake(0, 64, self.view.xf_width, 35);
    [self.view addSubview:titleSView];
    self.titleSView = titleSView;
    
    // 添加按钮
    NSArray *titlesArray = @[@"推荐", @"视频", @"图片", @"段子", @"网红", @"排行", @"社会", @"美女"];
    NSInteger count = titlesArray.count;
    CGFloat titleBtnW = 55;
    CGFloat titleBtnH = titleSView.xf_height;
    
    for (NSUInteger i = 0; i < count; i++) {
        XFTitleButton *titleBtn = [XFTitleButton buttonWithType:UIButtonTypeCustom];
        [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleSView addSubview:titleBtn];
        titleBtn.tag = i;
        
        // 设置数据
        [titleBtn setTitle:titlesArray[i] forState:UIControlStateNormal];
        
        // 设置 frame
        titleBtn.frame = CGRectMake(i * titleBtnW, 0, titleBtnW, titleBtnH);
    }
    
    // 按钮的选中颜色
    XFTitleButton *firstTitleButton = titleSView.subviews.firstObject;
    
    // 底部选中指示器
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [firstTitleButton titleColorForState:UIControlStateSelected];
    indicatorView.xf_height = 1;
    indicatorView.xf_y = titleSView.xf_height - indicatorView.xf_height;
    [titleSView addSubview:indicatorView];
    self.indicatorView = indicatorView;
    
    // 立即根据文字内容计算 label 的宽度
    [firstTitleButton.titleLabel sizeToFit];
    indicatorView.xf_width = firstTitleButton.titleLabel.xf_width;
    indicatorView.xf_centerX = firstTitleButton.xf_centerX;
    
    // 默认选中最前面的按钮
    firstTitleButton.selected = YES;
    self.selectedTitleBtn = firstTitleButton;
    
    titleSView.contentSize = CGSizeMake(count * titleBtnW, titleSView.xf_height);
    titleSView.showsHorizontalScrollIndicator = NO;
    titleSView.showsVerticalScrollIndicator = NO;
}

#pragma mark - 监听按钮点击

/**
 *  顶部标题按钮点击事件
 */
- (void)titleClick:(XFTitleButton *)titleButton {
    
    // 按钮重复点击 发出通知
    if (titleButton == self.selectedTitleBtn) {
        [[NSNotificationCenter defaultCenter] postNotificationName:XFTitleButtonDidRepeatClickNotification object:nil];
    }
    // 控制按钮状态
    self.selectedTitleBtn.selected = NO;
    titleButton.selected = YES;
    self.selectedTitleBtn = titleButton;
    
    // 指示器
    [UIView animateWithDuration:0.25 animations:^{
        
        self.indicatorView.xf_width = titleButton.titleLabel.xf_width;
        self.indicatorView.xf_centerX = titleButton.xf_centerX;
    }];
    
    // 滚动视图滚动到指定位置
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = titleButton.tag * self.scrollView.xf_width;
    [self.scrollView setContentOffset:offset animated:YES]; 
}

/**
 *  导航栏左边按钮点击事件  
 */
- (void)tagClick {
    XFLogFunc;
}

#pragma mark - 添加子控制器的view
- (void)addChildVcView {
    // 添加子控制器的 view 到 scrollview 中
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.xf_width;
    
    // 取出子控制器
    UIViewController *childVC = self.childViewControllers[index];
    
    if (childVC.view.window) return; // 如果窗口已经创建，就不需要再设置 frame
    
    childVC.view.frame = self.scrollView.bounds;
    [self.scrollView addSubview:childVC.view];
}

#pragma mark - <UIScrollViewDelegate>

/**
 *  使用有动画的方法结束时才调用这个方法
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self addChildVcView];
}

@end

















