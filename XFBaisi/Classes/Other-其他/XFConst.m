//
//  XFConst.m
//  XFBaisi
//
//  Created by xiaofans on 16/6/26.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <UIKit/UIKit.h>


/** 通用的间距值 */
CGFloat const XFMargin = 10;
/** 通用的小间距值 */
CGFloat const XFSmallMargin = XFMargin * 0.5;


/*
 //- (unsigned long long)fileSize {
 //// 总大小
 //unsigned long long size = 0;
 
 //// 文件管理者
 //NSFileManager *manager = [NSFileManager defaultManager];
 
 //// 文件属性
 //NSDictionary *attrs = [manager attributesOfItemAtPath:self error:nil];
 
 //if ([attrs.fileType isEqualToString:NSFileTypeDirectory]) {  // 文件夹类型
 //// 获得文件夹的大小  == 获得文件夹中所有文件的总大小
 //NSDirectoryEnumerator *enumerator = [manager enumeratorAtPath:self];
 //for (NSString *subpath in enumerator) {
 //// 全路径
 //NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
 //// 累加文件大小
 //size += [manager attributesOfItemAtPath:fullSubpath error:nil].fileSize;
 //}
 //} else { // 文件类型
 //size = attrs.fileSize;
 //}
 //return size;
 //}
 */