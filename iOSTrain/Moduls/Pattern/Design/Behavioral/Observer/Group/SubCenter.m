//
//  SubCenter.m
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "SubCenter.h"

static NSMutableDictionary *bookCenter = nil;

@implementation SubCenter

+ (void)initialize {
    if (self == [SubCenter class]) {
        bookCenter = [NSMutableDictionary dictionary];
    }
}

+ (void)creatDefault {
    [self creatNumber:@"default"];
}

// 创建书刊订阅号
+ (void)creatNumber:(NSString *)subNumber {
    NSHashTable *hashTable = [self existNumber:subNumber];
    if (hashTable == nil) {
        hashTable = [NSHashTable weakObjectsHashTable];
        [bookCenter setObject:hashTable forKey:subNumber];
    }
}

// 移除订阅号
+ (void)removeNumber:(NSString *)subNumber {
    NSHashTable *hashTable = [self existNumber:subNumber];
    if (hashTable) {
        [bookCenter removeObjectForKey:subNumber];
    }
}

// 添加用户
+ (void)addUser:(id <SubProtocol>)user wihtNumber:(NSString *)userNumber {
    NSHashTable *hashTable = [self existNumber:userNumber];
    [hashTable addObject:user];
}

// 移除用户
+ (void)removeUser:(id <SubProtocol>)user withNumber:(NSString *)userNumber {
    NSHashTable *hashTable = [self existNumber:userNumber];
    [hashTable removeObject:user];
}

// 发送消息
+ (void)sendMessage:(id)message withSubNumber:(NSString *)SubNumber {
    NSHashTable *hashTable = [self existNumber:SubNumber];
    if (hashTable) {
        NSEnumerator *enumerato = [hashTable objectEnumerator];
        id <SubProtocol> object = nil;
        
        while (object = [enumerato nextObject]) {
            if ([object respondsToSelector:@selector(subMessage:withSubNumber:)]) {
                [object subMessage:message withSubNumber:SubNumber];
            }
        }
    }
}

// 实现了代理方法
+ (NSHashTable *)existNumber:(NSString *)subStringNumber {
    return [bookCenter objectForKey:subStringNumber];
}

@end
