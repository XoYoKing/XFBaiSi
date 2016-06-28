//
//  XFTextFontCell.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/28.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFTextFontCell.h"

@implementation XFTextFontCell


- (IBAction)setTextFont:(UISegmentedControl *)sender {
    NSUInteger index = sender.selectedSegmentIndex;
    switch (index) {
        case 0: {   // 小号字体
            XFLog(@"选择小号字体");
        }
            break;
        case 1: {   // 中号字体
            XFLog(@"选择中号字体");
        }
            break;
        case 2: {   // 大号字体
            XFLog(@"选择大号字体");
        }
            break;
    }
}



@end
