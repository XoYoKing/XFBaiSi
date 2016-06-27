//
//  XFMeFooterView.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/26.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFMeFooterView.h"
#import "XFMeSquare.h"
#import "XFMeSquareButton.h"
#import "XFWebViewController.h"
#import "XFMoreViewController.h"



@implementation XFMeFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    //self.backgroundColor = [UIColor whiteColor];
    
    if (self) {
        // 参数
        //NSMutableDictionary *params = [NSMutableDictionary dictionary];
        //params[@"a"] = @"square";
        //params[@"c"] = @"topic";
        
        // 请求
        AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
        [manger GET:ME_HOME_URL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
            XFLog(@" me 页面数据请求成功");
            
            // 字典转模型
            NSArray *squares = [XFMeSquare mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
            
            [self createSquares:squares];
            //XFLog(@"%@", squares);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            XFLog(@"请求失败 - %@", error);
        }];
        
    }
    return self;
}

/**
 *  根据模型数据创建控件
 */
- (void)createSquares:(NSArray *)squares {
    // 按钮个数
    NSUInteger count = squares.count;
    // 按钮尺寸
    int maxColosCount = 4;  // 一行的最大列数
    CGFloat buttonW = self.xf_width / maxColosCount;
    CGFloat buttonH = buttonW;
    
    // 创建按钮
    for (NSUInteger i = 0; i < count; i++) {
        
        XFMeSquareButton *button = [XFMeSquareButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        button.xf_x = (i % maxColosCount) * buttonW;
        button.xf_y = (i / maxColosCount) * buttonH;
        button.xf_width =  buttonW;
        button.xf_height = buttonH;
        
        // 设置数据
        button.square = squares[i];
    }
    
    // 计算出总行数
    NSUInteger rowsCount = (count + maxColosCount - 1) / maxColosCount;
    // 设置 footer 的高度为行数 * 按钮高度
    self.xf_height = rowsCount * buttonH;
    
    UITableView *tableView = (UITableView *)self.superview;
    tableView.tableFooterView = self;
    [tableView reloadData];
}

- (void)buttonClick:(XFMeSquareButton *)button {

    NSString *url = button.square.url;
    
    // 获得 me 页面的导航控制器
    UITabBarController *tabBarVC = (UITabBarController *)self.window.rootViewController;
    UINavigationController *nav = tabBarVC.selectedViewController;
    
    if ([url hasPrefix:@"http"]) {        // 利用webView加载url
        XFWebViewController *webView = [[XFWebViewController alloc] init];
        webView.url = url;
        webView.navigationItem.title = button.currentTitle;
        
        // 获得 me 页面的导航控制器
        [nav pushViewController:webView animated:YES];
        
    } else if ([url hasPrefix:@"mod"]) {  // 另行处理
        if ([url hasSuffix:@"BDJ_To_Check"]) {
            XFLog(@"跳转到[审帖]界面");
            
        } else if ([url hasSuffix:@"BDJ_To_RecentHot"]) {
            XFLog(@"跳转到[每日排行]界面");
            
        } else {
            XFLog(@"跳转到其他界面");
        }
    } else {    // more 按钮
        XFMoreViewController *moreVC = [[XFMoreViewController alloc] init];
        [nav pushViewController:moreVC animated:YES];
    }
}



@end












