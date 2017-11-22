//
//  BYWorker.m
//  iOSTrain
//
//  Created by binyu on 2017/11/21.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYWorker.h"
#import <objc/runtime.h>

@implementation BYWorker

/*
- (void)encodeWithCoder:(NSCoder *)aCoder{
//    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
//    self = [super initWithCoder:aDecoder];
    self = [super init];
     self.name = [aDecoder decodeObjectForKey:@"name"];
     _age = [aDecoder decodeIntegerForKey:@"age"];
    return self;
}*/

/*
 Runtime 实现
 */
- (void)encodeWithCoder:(NSCoder *)aCoder{
    //    [super encodeWithCoder:aCoder];
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([BYWorker class], &count);
    for (int i=0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *ivarName =  ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:ivarName];
        id value =  [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
}


- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    //    self = [super initWithCoder:aDecoder];
    self = [super init];
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([BYWorker class], &count);
    for (int i=0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *ivarName =  ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:ivarName];
        id value =  [aDecoder decodeObjectForKey:key];
        [self setValue:value forKey:key];
    }
    return self;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"_name=%@,_age=%ld",_name,_age];
}
@end
