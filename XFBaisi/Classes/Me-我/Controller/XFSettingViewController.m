//
//  XFSettingViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFSettingViewController.h"
#import "XFClearCacheCell.h"


@interface XFSettingViewController ()

@end

@implementation XFSettingViewController

static NSString * const XFClearCacheCellID = @"XFClearCacheCell.h";

- (instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    self.view.backgroundColor = XFBaseBgColor;
    
    // 注册自定义 cell
    [self.tableView registerClass:[XFClearCacheCell class] forCellReuseIdentifier:XFClearCacheCellID];
    
}

#pragma mark - UITableViewController 数据源

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 取出 cell
    XFClearCacheCell *cell = [tableView dequeueReusableCellWithIdentifier:XFClearCacheCellID];
    
    // 返回 cell
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    XFLogFunc;
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


@end

















