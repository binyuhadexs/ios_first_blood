//
//  BYNSOperation.m
//  iOSTrain
//
//  Created by binyu on 2017/11/15.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYNSOperation.h"

@implementation BYNSOperation

- (void)start{
    //
     NSLog(@"start %@",[NSThread currentThread]);
    NSLog(@"开始干活了");
    if ([self isCancelled]) {
        return;
    }
//    [super start];
}

- (BOOL)isAsynchronous{
    NSLog(@"isAsynchronous------");
    return NO;
}

- (BOOL)isConcurrent{
    NSLog(@"isConcurrent------");
    return NO;
}

//非并发
- (void)main{
    @try{
        //执行任务的方法
        @autoreleasepool{ //
            NSLog(@"main %@",[NSThread currentThread]);
            //TODO
            
            //线程通讯 子——》主
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                //在主线程运行
                NSLog(@"mainQueue %@",[NSThread currentThread]);
                
            }];
        }
    }@catch(NSException *exception){
        
    }
}

@end
