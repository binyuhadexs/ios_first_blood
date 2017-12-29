//
//  AbstarctSpamMessages.m
//  iOSTrain
//
//  Created by binyu on 2017/12/12.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "AbstarctSpamMessages.h"

@implementation AbstarctSpamMessages

+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

// 空的垃圾机制方法
- (void)emptySpamMessages:(NSArray *)parameter withString:(NSString *)str{
    NSLog(@"parameter=%@,str=%@",parameter,str);
}

@end
