//
//  XFComSectionHeaderView.m
//  XFBaisi
//
//  Created by xiaofans on 16/7/6.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFComSectionHeaderView.h"

@implementation XFComSectionHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.textLabel.textColor = [UIColor darkGrayColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.textLabel.font = XFComSectionHeaderTestFont;
    
    self.textLabel.xf_x = XFSmallMargin;
}

@end


