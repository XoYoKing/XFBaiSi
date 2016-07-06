//
//  XFCommentViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/7/5.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFCommentViewController.h"

@interface XFCommentViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomMargin;
@property (weak, nonatomic) IBOutlet UITextField        *writeCommentTextField;
@property (weak, nonatomic) IBOutlet UITableView        *tableView;

@end

@implementation XFCommentViewController

#pragma mark - 初始化

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupBase];
    
    
}

- (void)setupBase {
    self.navigationItem.title = @"评论";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}

/**
 *  移除通知
 */
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - 监听事件

- (void)keyboardChangeFrame:(NSNotification *)notification {
    
    // 修改约束
    CGFloat keyboardY = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    self.bottomMargin.constant = screenH - keyboardY;
    
    // 动画显示
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
    
    

}

- (IBAction)voiceBtnClick:(UIButton *)sender {
    XFLog(@"发语音");
}

- (IBAction)rightBtnClick:(UIButton *)sender {
    XFLog(@"@谁呀");
}

#pragma mark - <UITableViewDateSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) return 1;
    if (section == 1) return 4;
    return 10;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) return nil;
    if (section == 1) return @"最热评论";
    return @"最新评论";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return nil;
}

#pragma mark - <UITableViewDelegate>

/**
 *  开始拖拽时关闭键盘
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}


@end








