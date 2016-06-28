//
//  XFSettingViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFSettingViewController.h"
#import "XFClearCacheCell.h"
#import "XFOtherCell.h"


@interface XFSettingViewController ()

@end

static NSString * const XFClearCacheCellID = @"XFClearCacheCell.h";
static NSString * const XFOtherCellID = @"XFOtherCellID";
static NSString * const XFSettingCellID = @"XFSettingCellID";

@implementation XFSettingViewController


- (instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    self.view.backgroundColor = XFBaseBgColor;
    
    // 注册自定义 cell
    [self.tableView registerClass:[XFClearCacheCell class] forCellReuseIdentifier:XFClearCacheCellID];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XFOtherCell class]) bundle:nil] forCellReuseIdentifier:XFOtherCellID];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:XFSettingCellID];
    
}

#pragma mark - UITableViewController 数据源

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return 1;
    if (section == 0) return 10;
    if (section == 1) return 5;
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 取出 cell
    //XFClearCacheCell *cell = [tableView dequeueReusableCellWithIdentifier:XFClearCacheCellID];
    
    // 清除缓存 cell
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        return [tableView dequeueReusableCellWithIdentifier:XFClearCacheCellID];;
    } else if (indexPath.row == 2) {
        return [tableView dequeueReusableCellWithIdentifier:XFOtherCellID];
    } else { // 其他 cell
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:XFSettingCellID];
        cell.textLabel.text = [NSString stringWithFormat:@"%zd - %zd", indexPath.section, indexPath.row];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    XFLogFunc;
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell isKindOfClass:[XFOtherCell class]]) {
        
    }
}


@end

















