//
//  Invoker.m
//  iOSTrain
//
//  Created by binyu on 2017/12/25.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "Invoker.h"

@interface Invoker ()

@property (nonatomic, strong) NSMutableArray *array;  // 存储操作的

@end


@implementation Invoker
+ (instancetype)sharedInstance
{
    static Invoker *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance.array = [NSMutableArray array];
        
    });
    return sharedInstance;
}

- (void)addAndExcute:(id <CommandProtocol>)command {
    [self.array addObject:command];
    [command excute];
}

- (void)goBack {
    id <CommandProtocol> command= self.array.lastObject;
    [command backExcute];
    [self.array removeLastObject];
}




@end
