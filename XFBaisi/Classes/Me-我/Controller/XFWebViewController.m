//
//  XFWebViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/27.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFWebViewController.h"

@interface XFWebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardItem;
@end

@implementation XFWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.webView.backgroundColor = XFBaseBgColor;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}

#pragma mark - 监听点击

- (IBAction)reload {    // 刷新
    [self.webView reload];
}

- (IBAction)back {      // 返回
    [self.webView goBack];
}

- (IBAction)forward {   // 前进
    [self.webView goForward];
}

#pragma mark - <UIWebViewDelegate>

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.backItem.enabled = webView.canGoBack;
    self.forwardItem.enabled = webView.canGoForward;
}



@end












