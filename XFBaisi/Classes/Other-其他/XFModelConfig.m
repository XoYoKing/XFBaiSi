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
#import "XFImage.h"
#import "XFGif.h"
#import "XFVideo.h"
#import "XFCommentUser.h"
#import "XFAudio.h"

@implementation XFModelConfig

+ (void)load {
    
    [XFComment mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"user" : @"u",
                 @"comUser" : @"user",
                 @"ID" : @"id"};
    }];
    
    [XFTopic mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"top_comment" : [XFComment class],
                 @"image" : [XFImage class],
                 @"gif" : [XFGif class],
                 @"video" : [XFVideo class],
                 @"audio" : [XFAudio class]};
        
    }];
    
    [XFTopic mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID" : @"id",
                 @"small_image" : @"image0",
                 @"middle_image" : @"image2",
                 @"large_image" : @"image1",
                 @"user" : @"u"};
    }];
    
}

@end
