//
//  XFSeeBigViewController.m
//  XFBaisi
//
//  Created by xiaofans on 16/7/4.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFSeeBigViewController.h"
#import "XFImage.h"
#import "XFGif.h"
#import "XFTopic.h"
#import <Photos/Photos.h>

@interface XFSeeBigViewController ()<UIScrollViewDelegate>

/** imageView */
@property (nonatomic, strong) UIImageView     *imageView;
/** 保存按钮 */
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
/** 转发按钮 */
@property (weak, nonatomic) IBOutlet UIButton *forwardButton;
/** 评论按钮 */
@property (weak, nonatomic) IBOutlet UIButton *commontButton;


@end

// 专属相册名字
static NSString *XFAssetCollectionTitle = @"仿百思不得姐";

@implementation XFSeeBigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = [UIScreen mainScreen].bounds;
    [self.view insertSubview:scrollView atIndex:0];
    scrollView.delegate = self;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [scrollView addSubview:imageView];
    self.imageView = imageView;
    imageView.xf_width = scrollView.xf_width;
    imageView.xf_x = 0;
    
    if ([self.topic.type isEqualToString:XFTopicImage]) {
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.topic.image.big.firstObject] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (image == nil) return;
            self.saveButton.enabled = YES;
        }];
        
        imageView.xf_height = self.topic.image.height * imageView.xf_width / self.topic.image.width;
        
        // 缩放比例
        CGFloat scale = self.topic.image.width / imageView.xf_width;
        if (scale > 1.0) {
            scrollView.maximumZoomScale = scale;
        }
        
    } else if ([self.topic.type isEqualToString:XFTopicGif]) {
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.topic.gif.images.firstObject] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (image == nil) return;
            self.saveButton.enabled = YES;
        }];
        
        imageView.xf_height = self.topic.gif.height * imageView.xf_width / self.topic.gif.width;
        
        // 缩放比例
        CGFloat scale = self.topic.image.width / imageView.xf_width;
        if (scale > 1.0) {
            scrollView.maximumZoomScale = scale;
        }
    }
    // 判断图片长度是否超出屏幕范围
    if (imageView.xf_height >= scrollView.xf_height) {
        imageView.xf_y = 0;
        
        scrollView.contentSize = CGSizeMake(0, imageView.xf_height);
    } else {
        imageView.xf_centerY = scrollView.xf_height * 0.5;
    }
    [self setupButton:self.forwardButton number:self.topic.forward placeholder:@"分享"];
    [self setupButton:self.commontButton number:self.topic.comment placeholder:@"评论"];
    
}

/**
 *  设置按钮文字
 */
- (void)setupButton:(UIButton *)button number:(NSInteger)number placeholder:(NSString *)placeholder {
    if (number >= 10000) {
        [button setTitle:[NSString stringWithFormat:@"%.1f万", number / 10000.0] forState:UIControlStateNormal];
    } else if (number > 0) {
        [button setTitle:[NSString stringWithFormat:@"%zd", number] forState:UIControlStateNormal];
    } else {
        [button setTitle:placeholder forState:UIControlStateNormal];
    }
}

#pragma mark - <UIScrollViewDelegate> 

// 返回一个scrollView的子控件进行缩放
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

#pragma mark - buttonClick

- (IBAction)backClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveClick {
    // 判断系统相册授权状态
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusRestricted) {            // 家长控制系统原因
        [self showError:@"由于系统原因无法访问相册"];
    } else if (status == PHAuthorizationStatusDenied) {         // 用户拒绝访问相册
        [self showError:@"请设置相册访问权限"];
    } else if (status == PHAuthorizationStatusAuthorized) {     // 用户允许访问相册
        [self saveImage];
    } else if (status == PHAuthorizationStatusNotDetermined) {  // 用户还没有做出选择
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (status == PHAuthorizationStatusAuthorized) {    // 用户点击允许
                [self saveImage];
            }
        }];
    }
}

- (void)saveImage {
    // PHAsset的标识, 利用这个标识可以找到对应的PHAsset对象(图片对象)
    __block NSString *assetLocalIdentifier = nil;
    
    // 1.保存到相机胶卷中
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        assetLocalIdentifier = [PHAssetCreationRequest creationRequestForAssetFromImage:self.imageView.image].placeholderForCreatedAsset.localIdentifier;
        
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        if (success == NO) {
            [self showError:@"保存图片失败"];
            return;
        }
        // 2.获得曾经创建过的相簿
        PHAssetCollection *createdAssetCollention = [self createdAssetCollention];
        if (createdAssetCollention == nil) {
            [self showError:@"相册创建失败"];
            return;
        }
        // 把刚才的兔图片加到专有相册中
        [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
            // 获得图片
            PHAsset *asset = [PHAsset fetchAssetsWithLocalIdentifiers:@[assetLocalIdentifier] options:nil].lastObject;
            // 添加图片到相册的请求
            PHAssetCollectionChangeRequest *request = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:createdAssetCollention];
            // 保存图片
            [request addAssets:@[asset]];
            
        } completionHandler:^(BOOL success, NSError * _Nullable error) {
            if (success == NO) {
                [self showError:@"保存图片失败"];
                return;
            } else {
                [self showSuccess:@"保存图片成功"];
            }
        }];
    }];
}

// 提醒信息
- (void)showSuccess:(NSString *)successText {
    dispatch_async(dispatch_get_main_queue(), ^{
        [SVProgressHUD showSuccessWithStatus:successText];
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    });
}

- (void)showError:(NSString *)errorText {
    dispatch_async(dispatch_get_main_queue(), ^{
        [SVProgressHUD showErrorWithStatus:errorText];
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    });
}

/**
 *  获得相册
 */
- (PHAssetCollection *)createdAssetCollention {
    // 从已有相册中查找这个应用对应的相册
    PHFetchResult<PHAssetCollection *> *assetCollentions = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    
    for (PHAssetCollection *assetCollection in assetCollentions) {
        if ([assetCollection.localizedTitle isEqualToString:XFAssetCollectionTitle]) {
            return assetCollection;
        }
    }
    // 没有找到相册，就创建新相册
    // PHAssetCollection标识. 可以找到对应的相册对象
    __block NSString *assetCollectionLocalIdentifier = nil;
    
    NSError *error = nil;
    
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        // 创建相册请求
        assetCollectionLocalIdentifier = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:XFAssetCollectionTitle].placeholderForCreatedAssetCollection.localIdentifier;
    } error:&error];
    
    if (error) return nil;
    
    // 获得刚才创建的相册
    return [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[assetCollectionLocalIdentifier] options:nil].lastObject;
    
}

- (IBAction)forwardClick:(UIButton *)sender {
    XFLog(@"转发");
}

- (IBAction)commontClick:(UIButton *)sender {
    XFLog(@"评论");
}



@end










