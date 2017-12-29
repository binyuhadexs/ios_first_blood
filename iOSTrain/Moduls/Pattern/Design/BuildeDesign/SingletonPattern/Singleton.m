//
//  Singleton.m
//  iOSTrain
//
//  Created by binyu on 2017/12/6.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

static id _singleton = nil;

+ (instancetype)sharedSingleton{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[self alloc] init];
    });
    return _singleton;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"%p",_singleton];
}


@end
