//
//  XFSettingViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFSettingViewController.h"
#import "XFClearCacheCell.h"
#import "XFTextFontCell.h"
#import "XFDayOrNightCell.h"
#import "XFWebViewController.h"


@interface XFSettingViewController ()

@end

static NSString * const XFTextFontCellID = @"XFTextFontCellID";
static NSString * const XFClearCacheCellID = @"XFClearCacheCell.h";
static NSString * const XFDayOrNightCellID = @"XFDayOrNightCellID";
static NSString * const XFOtherCellID = @"XFOtherCellID";

@implementation XFSettingViewController


- (instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    self.view.backgroundColor = XFBaseBgColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    // 注册自定义 cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XFTextFontCell class]) bundle:nil] forCellReuseIdentifier:XFTextFontCellID];
    
    [self.tableView registerClass:[XFClearCacheCell class] forCellReuseIdentifier:XFClearCacheCellID];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XFDayOrNightCell class]) bundle:nil] forCellReuseIdentifier:XFDayOrNightCellID];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:XFOtherCellID];
    
}



#pragma mark - UITableViewController 数据源

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) return 2;
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {   // 设置字体大小
            XFTextFontCell *cell = [tableView dequeueReusableCellWithIdentifier:XFTextFontCellID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell;
        }
        // 设置摇一摇夜间模式
        XFDayOrNightCell *cell = [tableView dequeueReusableCellWithIdentifier:XFDayOrNightCellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:XFOtherCellID];
        if (indexPath.row == 1) {
            cell.textLabel.text = @"推荐给朋友";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        } else if (indexPath.row == 2) {
            cell.textLabel.text = @"帮助";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        } else if (indexPath.row == 3) {
            cell.textLabel.text = [NSString stringWithFormat:@"当前版本：%.1f", 4.2];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        } else if (indexPath.row == 4) {
            cell.textLabel.text = @"关于我们";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        } else if (indexPath.row == 5) {
            cell.textLabel.text = @"隐私政策";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        } else if (indexPath.row == 6) {
            cell.textLabel.text = @"打分支持不得姐！";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
        
        return [tableView dequeueReusableCellWithIdentifier:XFClearCacheCellID];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //[tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.section == 0) {
        return;
    }
    if (indexPath.row == 0) {
        return;
    } else if (indexPath.row == 1) {
        XFLog(@"推荐给朋友");
    } else if (indexPath.row == 2) {
        XFWebViewController *webView = [[XFWebViewController alloc] init];
        webView.navigationItem.title = @"帮助";
        webView.url = SETTING_HELP_URL;
        [self.navigationController pushViewController:webView animated:YES];
    } else if (indexPath.row == 3) {
        return;
    } else if (indexPath.row == 4) {
        XFWebViewController *webView = [[XFWebViewController alloc] init];
        webView.navigationItem.title = @"关于我们";
        webView.url = SETTING_ABOUTUS_URL;
        [self.navigationController pushViewController:webView animated:YES];
    } else if (indexPath.row == 5) {
        XFWebViewController *webView = [[XFWebViewController alloc] init];
        webView.navigationItem.title = @"隐私政策";
        webView.url = SETTING_POLICY_URL;
        [self.navigationController pushViewController:webView animated:YES];
    } else {
        XFLog(@"打分支持不得姐！");
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/bai-si-bu-jie-zui-da-gao-xiao/id1093382986?mt=8"]];
    }
}


@end

















