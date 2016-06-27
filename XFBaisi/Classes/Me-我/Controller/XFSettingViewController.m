//
//  XFSettingViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFSettingViewController.h"


@interface XFSettingViewController ()

@end

@implementation XFSettingViewController

- (instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    self.view.backgroundColor = XFBaseBgColor;
    
    [self getCacheSize];
    
}
/**
 *  计算文件夹大小
 */
- (void)getCacheSize {
    // 总大小
    unsigned long long size = 0;
    
    // 获得缓存文件夹路径
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    NSString *dirpath = [cachesPath stringByAppendingPathComponent:@"default"];
    //    XMGLog(@"%@", dirpath);
    
    // 文件管理者
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // 获得文件夹的大小  == 获得文件夹中所有文件的总大小
    // Enumerator : 遍历器\迭代器
    NSDirectoryEnumerator *enumerator = [manager enumeratorAtPath:dirpath];
    for (NSString *subpath in enumerator) {
        // 全路径
        NSString *fullSubpath = [dirpath stringByAppendingPathComponent:subpath];
        // 累加文件大小
        size += [manager attributesOfItemAtPath:fullSubpath error:nil].fileSize;
    }
    
    XFLog(@"%zd", size);
}

#pragma mark - UITableViewController 数据源

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"settingCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = @"清除缓存";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    XFLog(@"%@", NSHomeDirectory());
    
    return cell;
}



@end

















