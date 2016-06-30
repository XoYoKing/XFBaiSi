//
//  XFAllViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/28.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFRecomViewController.h"
#import "XFTopic.h"
#import "XFTopicCell.h"

@interface XFRecomViewController ()

@property (nonatomic, strong) NSMutableArray<XFTopic *> *topics;    // 所有帖子数量
@property (nonatomic, copy) NSString *maxtime;                      // 加载下一页数据

@property (nonatomic, strong) XFHTTPSessionManager *manager;        // 任务管理者

@end


static NSString *const XFTopicCellId = @"topic";

@implementation XFRecomViewController

#pragma mark - 懒加载
- (XFHTTPSessionManager *)manager {
    if (!_manager) {
        _manager = [XFHTTPSessionManager manager];
    }
    return _manager;
}

#pragma mark - 初始化

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTabelView];
    
    [self setupRefresh];
}

- (void)setupTabelView {
    self.tableView.backgroundColor = XFBaseBgColor;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone; // 取消底部分割线
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.rowHeight = 250;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XFTopicCell class]) bundle:nil] forCellReuseIdentifier:XFTopicCellId];
}

- (void)setupRefresh {
    self.tableView.mj_header = [XFRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [XFRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
}

#pragma mark - 加载数据

/** 
 *  刷新数据
 */
- (void)loadNewTopics {
    // 取消所有请求
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    
    // 请求
    [self.manager GET:XFCommon_URL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        // 存储maxtime(方便用来加载下一页数据)
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        // 字典转模型
        self.topics  = [XFTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        // 刷新表格
        [self.tableView reloadData];
        
        // 控件结束刷新
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        XFLog(@"请求失败 - %@", error);
        // 控件结束刷新
        [self.tableView.mj_header endRefreshing];
    }];
}

/**
 *  加载更多数据
 */
-(void)loadMoreTopics {
    // 取消所有请求
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"maxtime"] = self.maxtime;
    
    // 请求
    [self.manager GET:XFCommon_URL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        // 存储maxtime(方便用来加载下一页数据)
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        // 字典转模型
        NSArray *moreTopics  = [XFTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.topics addObjectsFromArray:moreTopics];
        
        // 刷新表格
        [self.tableView reloadData];
        
        // 控件结束刷新
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        XFLog(@"请求失败 - %@", error);
        // 控件结束刷新
        [self.tableView.mj_footer endRefreshing];
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XFTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:XFTopicCellId];
    
    cell.topic = self.topics[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    XFLogFunc
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //return 200;
//}


@end
























