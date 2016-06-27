//
//  XFMeSquareButton.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/27.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFMeSquareButton.h"
#import "XFMeSquare.h"

@implementation XFMeSquareButton


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.xf_y = self.xf_height * 0.2;
    self.imageView.xf_height = self.xf_height * 0.5;
    self.imageView.xf_width = self.imageView.xf_height;
    self.imageView.xf_centerX = self.xf_width * 0.5;
    
    self.titleLabel.xf_x = 0;
    self.titleLabel.xf_y = self.imageView.xf_bottom;
    self.titleLabel.xf_width = self.xf_width;
    self.titleLabel.xf_height = self.imageView.xf_height * 0.5;
}

- (void)setSquare:(XFMeSquare *)square {
    _square = square;
    
    [self setTitle:square.name forState:UIControlStateNormal];
    [self sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"setup-head-default"]];
}

@end
















