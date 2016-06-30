//
//  XFModelConfig.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/30.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFModelConfig.h"
#import "XFTopic.h"
#import "XFComment.h"

@implementation XFModelConfig

+ (void)load {
    [XFTopic mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"top_cmt" : [XFComment class]};
    }];
    
    [XFTopic mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"top_cmt" : @"top_cmt[0]"};
    }];
    
}

@end
