//
//  XFDayOrNightCell.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/28.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFDayOrNightCell.h"

@implementation XFDayOrNightCell


- (IBAction)setDayOrNight:(UISwitch *)sender {
    if (sender.on) {
        XFLog(@"打开");
    } else {
        XFLog(@"关闭");
    }
    
}

@end
