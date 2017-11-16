//
//  BYNSOperationDefineTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/14.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYNSOperationDefineTestViewController.h"
#import "BYNSOperation.h"

/*
 回调方式
 代理
 通知
 block
 
 如何封装网络请求框架？？
 
 */

@interface BYNSOperationDefineTestViewController ()

@property (nonatomic,strong)NSOperationQueue *queue;

@end

@implementation BYNSOperationDefineTestViewController

//TODO

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self testOperation];
}


- (void)testOperation{
//    BYNSOperation *op1 = [[BYNSOperation alloc] init];
//    BYNSOperation *op2 = [[BYNSOperation alloc] init];
//    BYNSOperation *op3 = [[BYNSOperation alloc] init];
//    BYNSOperation *op4 = [[BYNSOperation alloc] init];
//    [self.queue addOperations:@[op1,op2,op3,op4] waitUntilFinished:NO];
    
    for (int i = 0;i< 1000 ; i++) {
        BYNSOperation *op1 = [[BYNSOperation alloc] init];
        [self.queue  addOperation:op1];
    }
}

- (NSOperationQueue *)queue{
    if (!_queue) {
         _queue = [[NSOperationQueue alloc]init]; //并发 异步执行
        [_queue setMaxConcurrentOperationCount:3];//并发
    }
    return _queue;
}

@end
