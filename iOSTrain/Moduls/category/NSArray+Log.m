//
//  NSArray+Log.m
//  003--NSLog技巧
//
//  Created by H on 17/2/8.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)
//模拟 NSArray 重新输出
-(NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString * strM = [NSMutableString stringWithString:@"(\n"];
    //遍历数组内容,顺序拼接字符串
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [strM appendFormat:@"\t%@,\n",obj];
    }];
    [strM appendString:@")\n"];
    return strM;
}

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level{
    
    NSMutableString * strM = [NSMutableString stringWithString:@"(\n"];
    //遍历数组内容,顺序拼接字符串
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [strM appendFormat:@"\t%@,\n",obj];
    }];
    [strM appendString:@")\n"];
    return strM;
}

@end

@implementation NSDictionary (Log)
-(NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString * strM = [NSMutableString stringWithString:@"(\n"];
    //遍历数组内容,顺序拼接字符串
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [strM appendFormat:@"\t%@ = %@;\n",key,obj];
    }];
    [strM appendString:@")\n"];
    return strM;
}
@end
