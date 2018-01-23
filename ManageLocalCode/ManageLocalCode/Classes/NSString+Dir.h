//
//  NSString+Dir.h
//  BIApp
//
//  Created by GX on 15/6/2.
//  Copyright (c) 2015年 GX. 将模型存到沙盒
//   NSString *accountPath = [@"account.data" appendDocumentDir];  调用方式，但也会被封装起来

#import <Foundation/Foundation.h>

@interface NSString (Dir)
/**
 *  追加文档目录
 */
- (NSString *)appendDocumentDir;
/**
 *  追加缓存目录
 */
- (NSString *)appendCacherDir;
/**
 *  追加临时目录
 */
- (NSString *)appendTempDir;

@end
