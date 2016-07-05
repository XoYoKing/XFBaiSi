//
//  XFMeViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFMeViewController.h"
#import "XFSettingViewController.h"
#import "XFMeTableViewCell.h"
#import "XFMeFooterView.h"
#import "XFLoginRegisterViewController.h"

@interface XFMeViewController ()

@end

@implementation XFMeViewController

/**
 *  重写 init
 */
- (instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self setupNav];
    
}

#pragma mark - 初始化

/**
 *  导航栏
 */
- (void)setupNav {
    self.navigationItem.title = @"我的";
    
    // 右边 - 设置
    UIBarButtonItem *settingItem = [UIBarButtonItem xf_itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    
    // 右边 - 月亮
    UIBarButtonItem *moonItem = [UIBarButtonItem xf_itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
}

/**
 *  tableview
 */
- (void)setupTableView {
    self.tableView.backgroundColor = XFBaseBgColor;
    
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = XFMargin;
    self.tableView.contentInset = UIEdgeInsetsMake(XFMargin - 35, 0, 0, 0);
    
    // 设置 footer
    self.tableView.tableFooterView = [[XFMeFooterView alloc] init];
}

#pragma mark - 监听导航按钮
- (void)settingClick {
    XFSettingViewController *settingVC = [[XFSettingViewController alloc] init];
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)moonClick {
    XFLogFunc;
}

#pragma mark - UITableViewController 数据源

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"meCell";
    XFMeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[XFMeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    // 设置数据
    if (indexPath.section == 0) {
        cell.textLabel.text = @"登录/注册";
        cell.imageView.image = [UIImage imageNamed:@"setup-head-default"];
    } else {
        cell.textLabel.text = @"离线下载";
         //只要有其他cell设置过imageView.image, 其他不显示图片的cell都需要设置imageView.image = nil
        cell.imageView.image = nil;
        
        //cell.textLabel.text = @"我的身份";
        //cell.imageView.image = [UIImage imageNamed:@"Profile_AddV_authen"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        XFLoginRegisterViewController *loginRegisterVC = [[XFLoginRegisterViewController alloc] init];
        [self presentViewController:loginRegisterVC animated:YES completion:nil];
    } else {
        XFLog(@"离线下载");
    }
}




@end
















