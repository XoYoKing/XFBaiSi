//
//  XFMeFooterView.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/26.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFMeFooterView.h"


@implementation XFMeFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 参数
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"square";
        params[@"c"] = @"topic";
        
        // 请求
        AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
        [manger GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
            XFLog(@"请求成功 - %@", responseObject);
            
            //[responseObject writeToFile:@"/Users/zhyks/Desktop/me.plist" atomically:YES];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            XFLog(@"请求失败 - %@", error);
        }];
        
    }
    return self;
}

@end












