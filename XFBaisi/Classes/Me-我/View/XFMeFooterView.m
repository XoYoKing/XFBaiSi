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


@implementation XFMeFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    //self.backgroundColor = [UIColor whiteColor];
    
    if (self) {
        // 参数
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"square";
        params[@"c"] = @"topic";
        
        // 请求
        AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
        [manger GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
            //XFLog(@"请求成功");
            
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
        // i 位置对应的模型数据
        XFMeSquare *square = squares[i];
        
        XFMeSquareButton *button = [XFMeSquareButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        button.xf_x = (i % maxColosCount) * buttonW;
        button.xf_y = (i / maxColosCount) * buttonH;
        button.xf_width =  buttonW;
        button.xf_height = buttonH;
        
        // 设置数据
        [button setTitle:square.name forState:UIControlStateNormal];
        [button sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"setup-head-default"]];
    }
    // 设置 footer 的高度为最后一个按钮的最大 y 值
    self.xf_height = self.subviews.lastObject.xf_bottom;
    
    UITableView *tableView = (UITableView *)self.superview;
    tableView.tableFooterView = self;
    [tableView reloadData];
}

- (void)buttonClick {
    XFLogFunc;
}



@end












