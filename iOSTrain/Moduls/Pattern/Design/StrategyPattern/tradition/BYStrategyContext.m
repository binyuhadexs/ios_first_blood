//
//  BYStrategyContext.m
//  iOSTrain
//
//  Created by binyu on 2017/11/29.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYStrategyContext.h"
#import "BYStrategy.h"

@implementation BYStrategyContext



- (void)doOperaterOne:(NSInteger)one two:(NSInteger)two{
   NSString *str =  [_strategy doOperaterOne:one two:two];
    NSLog(@"%@",str);
}


@end
