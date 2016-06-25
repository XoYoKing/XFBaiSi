//
//  XFQuickLoginBtn.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFQuickLoginBtn.h"

@implementation XFQuickLoginBtn

- (void)awakeFromNib {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.xf_y = 0;
    self.imageView.xf_centerX = self.xf_width * 0.5;
    
    self.titleLabel.xf_x = 0;
    self.titleLabel.xf_y = self.imageView.xf_bottom;
    self.titleLabel.xf_height = self.xf_height - self.titleLabel.xf_y;
    self.titleLabel.xf_width = self.xf_width;
}

@end
