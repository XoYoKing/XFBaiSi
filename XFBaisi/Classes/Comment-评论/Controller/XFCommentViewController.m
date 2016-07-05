//
//  XFCommentViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/7/5.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFCommentViewController.h"

@interface XFCommentViewController ()<UITableViewDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomMargin;

@property (weak, nonatomic) IBOutlet UITextField *writeCommentTextField;

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

#pragma mark - <UITableViewDelegate>

/**
 *  开始拖拽时
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}


@end








