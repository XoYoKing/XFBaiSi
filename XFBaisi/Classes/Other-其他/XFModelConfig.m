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
#import "XFUser.h"
#import "XFTopCmtUser.h"
#import "XFImage.h"
#import "XFGif.h"
#import "XFVideo.h"

@implementation XFModelConfig

+ (void)load {
    
    [XFComment mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"u" : [XFTopCmtUser class]};
    }];
    
    
    [XFTopic mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"top_comment" : [XFComment class],
                 @"u" : [XFUser class],
                 @"image" : [XFImage class],
                 @"gif" : [XFGif class],
                 @"video" : [XFVideo class]};
        
    }];
    
    [XFTopic mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"top_cmt" : @"top_cmt[0]",
                 @"small_image" : @"image0",
                 @"middle_image" : @"image2",
                 @"large_image" : @"image1",
                 @"user" : @"u"};
    }];
    
}

@end
