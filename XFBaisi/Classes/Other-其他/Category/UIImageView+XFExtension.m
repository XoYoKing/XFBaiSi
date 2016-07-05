//
//  UIImageView+XFExtension.m
//
//  Created by xiaofan on 16/7/5.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "UIImageView+XFExtension.h"
#import "UIImage+XFExtension.h"

@implementation UIImageView (XFExtension)

- (void)xf_setHeader:(NSString *)url {
    UIImage *placeholderImage = [UIImage xf_circleImage:@"defaultUserIcon"];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (image == nil) return;
        
        self.image = [image xf_circleImage];
    }];
}

@end
