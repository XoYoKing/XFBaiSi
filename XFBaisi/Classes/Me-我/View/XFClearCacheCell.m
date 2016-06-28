//
//  XFClearCacheCell.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/27.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFClearCacheCell.h"

#define XFCustomCacheFile [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"Custom"]

@implementation XFClearCacheCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 显示正在计算缓存提示
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [loadingView startAnimating];
        self.accessoryView = loadingView;
        self.textLabel.text = @"清除缓存(正在计算缓存大小。。。)";
        
        // 计算时不可点击 cell
        self.userInteractionEnabled = NO;
        
        // 弱引用 self
        __weak typeof(self) weakSelf = self;
        
        // 子线程计算缓存大小
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            // 获得缓存文件夹路径 (这个是比较耗时的)
            unsigned long long size = XFCustomCacheFile.fileSize;
            size += [SDImageCache sharedImageCache].getSize;
            
            // 如果cell已经销毁了, 就直接返回
            if (weakSelf == nil) return;
            
            NSString *sizeText = nil;
            if (size >= pow(10, 9)) {           // size >= 1GB
                sizeText = [NSString stringWithFormat:@"%.2fGB", size / pow(10, 9)];
            } else if (size >= pow(10, 6)) {    // 1GB > size >= 1MB
                sizeText = [NSString stringWithFormat:@"%.2fMB", size / pow(10, 6)];
            } else if (size >= pow(10, 3)) {    // 1MB > size >= 1KB
                sizeText = [NSString stringWithFormat:@"%.2fKB", size / pow(10, 3)];
            } else {                            // 1KB > size
                sizeText = [NSString stringWithFormat:@"%zdB", size];
            }
            // 生成显示文字
            NSString *text = [NSString stringWithFormat:@"清除缓存(%@)", sizeText];
            
            // 回到主线程显示文字
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.textLabel.text = text;
                weakSelf.accessoryView = nil;
                weakSelf.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
                // 添加手势点击识别
                [weakSelf addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:weakSelf action:@selector(clearCache)]];
                // 恢复点击事件
                weakSelf.userInteractionEnabled = YES;
            });
        });
        
        //XFLog(@"%@", NSHomeDirectory());
    }
    return self;
}

/**
 *  清除缓存
 */
- (void)clearCache {
    
    // 显示指示器
    [SVProgressHUD showWithStatus:@"正在清除缓存..."];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    // 删除 SDWebImage 缓存文件
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        dispatch_sync(dispatch_get_global_queue(0, 0), ^{
            // 自定义的缓存
            NSFileManager *manager = [NSFileManager defaultManager];
            [manager removeItemAtPath:XFCustomCacheFile error:nil];
            [manager createDirectoryAtPath:XFCustomCacheFile withIntermediateDirectories:YES attributes:nil error:nil];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [SVProgressHUD showSuccessWithStatus:@"清除缓存成功"];
                // 延迟2秒隐藏成功指示器
                [self performSelector:@selector(dismissHUD) withObject:nil afterDelay:1.0];
                
                self.textLabel.text = @"清除缓存(0KB)";
            });
            
        });
    }];
}

/**
 *  隐藏指示器
 */
- (void)dismissHUD {
    [SVProgressHUD dismiss];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // cell 重新出现时，如果还没计算完，继续转圈圈
    UIActivityIndicatorView *loadingView = (UIActivityIndicatorView *) self.accessoryView;
    [loadingView startAnimating];
}


@end












