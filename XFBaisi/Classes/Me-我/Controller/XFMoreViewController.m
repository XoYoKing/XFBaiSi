//
//  XFMoreViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/27.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFMoreViewController.h"
#import "XFMeSquare.h"
#import "XFMeSquareButton.h"
#import "XFWebViewController.h"

@interface XFMoreViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation XFMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"更多";
    
    [self setupScrollView];
    
    [self getMoreDate];
}

#pragma mark - 初始化

/**
 *  创建滚动视图
 */
- (void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.xf_width, self.view.xf_height)];
    scrollView.backgroundColor = XFBaseBgColor;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
}

/**
 *   获取服务器数据
 */
- (void)getMoreDate {
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"square";
    params[@"c"] = @"topic";
    
    // 请求
    [[XFHTTPSessionManager manager] GET:ME_MORE_URL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        
        // 字典转模型
        NSArray *squares = [XFMeSquare mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
        
        [self createSquares:squares];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        XFLog(@"请求失败 - %@", error);
    }];
    
}

/**
 *  根据模型数据创建控件
 */
- (void)createSquares:(NSArray *)squares {
    // 按钮个数
    NSUInteger count = squares.count;
    // 按钮尺寸
    int maxColosCount = 4;  // 一行的最大列数
    CGFloat buttonW = self.scrollView.xf_width / maxColosCount;
    CGFloat buttonH = buttonW;
    
    // 创建按钮
    for (NSUInteger i = 0; i < count; i++) {
        
        XFMeSquareButton *button = [XFMeSquareButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:button];
        
        button.xf_x = (i % maxColosCount) * buttonW;
        button.xf_y = (i / maxColosCount) * buttonH;
        button.xf_width =  buttonW;
        button.xf_height = buttonH;
        
        if (i == count - 1) {
            [button setHidden:YES];
        }
        
        // 设置数据
        button.square = squares[i];
    }
    
    // 计算出总行数
    NSUInteger rowsCount = (count + maxColosCount - 1) / maxColosCount;
    self.scrollView.contentSize = CGSizeMake(self.view.xf_width, rowsCount * buttonH);
}

- (void)buttonClick:(XFMeSquareButton *)button {
    
    NSString *url = button.square.url;
    
    if ([url hasPrefix:@"http"]) {        // 利用webView加载url
        XFWebViewController *webView = [[XFWebViewController alloc] init];
        webView.url = url;
        webView.navigationItem.title = button.currentTitle;

        [self.navigationController pushViewController:webView animated:YES];
        
    } else if ([url hasPrefix:@"mod"]) {  // 另行处理
        if ([url hasSuffix:@"BDJ_To_Check"]) {
            XFLog(@"跳转到[审帖]界面");
            
        } else if ([url hasSuffix:@"BDJ_To_RecentHot"]) {
            XFLog(@"跳转到[每日排行]界面");
            
        } else {
            XFLog(@"跳转到其他界面");
        }
    } else {    // more 按钮
        XFLog(@"不是http或者mod协议的");
    }
}


@end
