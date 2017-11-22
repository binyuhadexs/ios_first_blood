//
//  BYPersionCopy.m
//  iOSTrain
//
//  Created by binyu on 2017/11/21.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYPersionCopy.h"

@implementation BYPersionCopy


/*
 1 类直接继承自NSObject，无需调用[super copyWithZone:zone]
 2 父类实现了copy协议，子类也实现了copy协议，子类需要调用[super copyWithZone:zone]
 3 父类没有实现copy协议，子类实现了copy协议，子类无需调用[super copyWithZone:zone]
 4、copyWithZone方法中要调用[[[self class] alloc] init]来分配内存
 */
- (id)copyWithZone:(nullable NSZone *)zone{
    BYPersionCopy *per = [[[self class] allocWithZone:zone] init];
    if (per) {
//        per.name =  [self.name copyWithZone:zone]; //copyWithZone: 这种拷贝方式只能够提供一层内存拷贝(one-level-deep copy)，而非真正的深复制
//        per.avar = [self.avar copyWithZone:zone];
//        per.schoolmates =  [self.schoolmates copyWithZone:zone];
        per.name = [_name mutableCopy];
        per.avar = [_avar mutableCopy];; /*浅拷贝 */
        per.schoolmates =[_schoolmates mutableCopy];
    }
    return per;
}

- (id)mutableCopyWithZone:(nullable NSZone *)zone{
    BYPersionCopy *per = [[BYPersionCopy alloc] init];
    if (per) {
        per.name = [_name mutableCopy];
        per.avar = [_avar mutableCopy];; /*浅拷贝 */
        per.schoolmates =[_schoolmates mutableCopy];
    }
    return per;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"_name=%@,_avar=%@,_schoolmates=%@,_name=%p,_avar=%p,_schoolmates=%p",_name,_avar,_schoolmates,_name,_avar,_schoolmates];
}

@end
