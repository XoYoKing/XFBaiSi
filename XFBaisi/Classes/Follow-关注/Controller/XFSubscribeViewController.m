//
//  XFSubscribeViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/7/5.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFSubscribeViewController.h"
#import "XFSubscribeCell.h"
#import "XFSubscribeTag.h"

@interface XFSubscribeViewController ()<UISearchBarDelegate>

/** 订阅标签数组 */
@property (nonatomic, strong) NSArray<XFSubscribeTag *> *subscribeTags;
/** manager */
@property (nonatomic, strong) XFHTTPSessionManager *manager;

@end

static NSString *const XFSubscribeCellID = @"XFSubscribeCell";

@implementation XFSubscribeViewController

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
    
    [self setupTableView];
    
    [self loadSubscribeTags];
}

- (void)setupTableView {
    self.tableView.backgroundColor = XFBaseBgColor;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XFSubscribeCell class]) bundle:nil] forCellReuseIdentifier:XFSubscribeCellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
    // 搜索框
    UISearchBar *search = [[UISearchBar alloc] init];
    search.frame = CGRectMake(0, 0, 0, 40);
    search.placeholder = @"搜索标签";
    search.autocorrectionType = UITextAutocorrectionTypeNo;
    search.autocapitalizationType = UITextAutocapitalizationTypeNone;
    search.showsCancelButton = NO;
    search.delegate = self;
    
    self.tableView.tableHeaderView = search;
    
}


- (void)loadSubscribeTags {
    
    [SVProgressHUD showWithStatus:@"加载中..."];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    
    __weak typeof(self) weakSelf = self;
    
    [self.manager GET:SUBSCRIBE_URL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        weakSelf.subscribeTags = [XFSubscribeTag mj_objectArrayWithKeyValuesArray:responseObject[@"rec_tags"]];
        
        [self.tableView reloadData];
        
        [SVProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        XFLog(@"error:%@", error);
        [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍候再试"];
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    }];
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [SVProgressHUD dismiss];
    
    [self.manager invalidateSessionCancelingTasks:YES];
}

#pragma mark - 搜索框代理事件
// 开始编辑搜索框
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
    searchBar.showsCancelButton = YES;
    
    NSArray *subViews = [(searchBar.subviews[0]) subviews];
    for (id view in subViews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton* cancelbutton = (UIButton* )view;
            [cancelbutton setTitle:@"取消" forState:UIControlStateNormal];
            break;
        }
    }
}
// 点击搜索
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    XFLog(@"点击搜索");
}
// 点击取消按钮
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    searchBar.showsCancelButton = NO;
    [searchBar resignFirstResponder];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.subscribeTags.count;
    //return 30;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"推荐标签";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XFSubscribeCell *cell = [tableView dequeueReusableCellWithIdentifier:XFSubscribeCellID];
    
    cell.subscribeTag = self.subscribeTags[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}


@end


