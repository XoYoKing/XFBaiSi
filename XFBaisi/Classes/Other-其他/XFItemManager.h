//
//  XFItemManager.h
//  XFBaisi
//
//  Created by xiaofans on 16/6/25.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XFItemManager : NSObject

+ (UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
