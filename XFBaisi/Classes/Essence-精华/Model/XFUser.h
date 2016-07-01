//
//  XFUser.h
//  XFBaisi
//
//  Created by xiaofans on 16/6/30.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XFUserHeader;

@interface XFUser : NSObject

@property (nonatomic, copy) NSString *name;

/** header */
@property (nonatomic, strong) XFUserHeader *header;

@end
