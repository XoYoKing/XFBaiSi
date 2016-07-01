//
//  XFTopicViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/7/1.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFTopicViewController.h"
#import "XFTopicCell.h"

@interface XFTopicViewController ()

@property (nonatomic, strong) NSMutableArray<XFTopic *> *topics;    // 所有帖子数量
@property (nonatomic, copy) NSString *maxtime;                      // 加载下一页数据

@property (nonatomic, strong) XFHTTPSessionManager *manager;        // 任务管理者


//- (NSString *)aParam;

@end

static NSString *const XFTopicCellId = @"topic";

@implementation XFTopicViewController



- (XFTopicType)type {
    return 0;
}

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
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XFTopicCell class]) bundle:nil] forCellReuseIdentifier:XFTopicCellId];
}

- (void)setupRefresh {
    self.tableView.mj_header = [XFRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [XFRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
}

//- (NSString *)aParam {
    
//}

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
    params[@"type"] = @(self.type);
    
    // 请求
    [self.manager GET:XFCommon_URL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        // 存储maxtime(方便用来加载下一页数据)
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        // 字典转模型
        self.topics  = [XFTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        //XFWriteToPlist(responseObject, @"shipin");
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
    params[@"type"] = @(self.type);
    
    // 请求
    [self.manager GET:XFCommon_URL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        // 存储maxtime(方便用来加载下一页数据)
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        // 字典转模型
        NSArray<XFTopic *> *moreTopics  = [XFTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.topics[indexPath.row].cellHeight;
}

@end
