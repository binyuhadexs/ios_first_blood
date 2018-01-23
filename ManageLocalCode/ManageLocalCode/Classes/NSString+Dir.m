//
//  NSString+Dir.m
//  BIApp
//
//  Created by GX on 15/6/2.
//  Copyright (c) 2015年 GX. All rights reserved.
//

#import "NSString+Dir.h"

@implementation NSString (Dir)
/**
 *  追加文档目录
 */
- (NSString *)appendDocumentDir
{
   return [self appendDir:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]];
}
/**
 *  追加缓存目录
 */
- (NSString *)appendCacherDir
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}
/**
 *  追加临时目录
 */
- (NSString *)appendTempDir
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

// 要拼接的字符
- (NSString *)appendDir:(NSString *)dir   // 相当于传了docPath过来
{
   return [dir stringByAppendingPathComponent:self];
}

// 相当于封装了这两行代码
//NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//        NSString *accountPath = [docPath stringByAppendingPathComponent:@"account.data"];

@end
