//
//  XFTitleButton.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/28.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFTitleButton.h"

@implementation XFTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 正常状态颜色
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        // 点击选中状态颜色
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        self.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return self;
}

/**
 *  防止长按按钮标题颜色变化重写此方法
 */
- (void)setHighlighted:(BOOL)highlighted {
    
}

@end
