//
//  BYNSOperationTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/14.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYNSOperationTestViewController.h"

@interface BYNSOperationTestViewController ()

/*
 NSOperation
 NSBlockOperation  操作数 > 1 会开启子线程 默认子线程
     设置监听：setCompletionBlock
 NSInvocationOperation  如何开启子线程 ？
 NSOperationQueue  -- 并发队列，异步执行
     最大并发数
     队列 暂停-取消-恢复
     优先级
     依赖
 自定义NSOperation
 
 
 */

/**
NSOperaton 是苹果大力推荐的"并发"技术!
NSOperation 的核心概念:将"操作" 添加到 "队列"
GCD  将"任务"添加到 "队列"


NSOperation 类 是一个抽象类
特点:
- 不能直接使用!
目的:
- 定义子类共有的属性和方法
子类:
NSInvocationOperation
NSBlockOperation


---
GCD & NSOperation 对比
GCD 在 iOS 4.0 推出,主要针对多核处理器做了优化的并发技术,是C语言的
- 将"任务"[block]添加到 队列[串行/并发/主队列/全局队列] ,并且指定执行任务的函数[同步/异步]
- 线程间的通讯  dispatch_get_main_queue()
- 提供了一些 NSOperation 不具备的功能
- 一次执行
- 延迟执行
- 调度组(在op中也可以做到,有点麻烦)

NSOperation 在 iOS 2.0 推出的,苹果推出 GCD以后,对NSOperation 底层做了重写!
- 将操作[异步执行的任务] 添加到队列[并发队列],就会立刻异步执行
- mainQueue
- 提供了一些GCD 实现起来比较困难的功能
- 最大并发线程
- 队列的暂停/继续
- 取消所有操作
- 指定操作之间的依赖关系(GCD 用同步来实现)
*/

@property(nonatomic,strong) NSOperationQueue *queue;
@property(nonatomic,assign) NSInteger count;
@end

@implementation BYNSOperationTestViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //TODO
    
//    [self testBlockOperation];
//    [self NSBlockOperationDemo2];
//    [self NSBlockOperationDemo3];
//    [self NSBlockOperationDemo4];
//    [self NSInvocationOperationDemo1];
//    [self NSOperationQueueDemo1];
//    [self NSOperationQueueDemo2];
    [self NSOperationQueueDemo3];
    
}

#pragma mark NSBlockOperation
//NSBlockOperation
- (void)testBlockOperation{
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        [self testOne];
    }];
    [operation start]; // //开启任务,不开线程
    // blocks cannot be added after the operation has started executing or finished
//    [operation addExecutionBlock:^{
//    }];
}

-(void)NSBlockOperationDemo2{
    //队列(并发队列，异步执行)
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    //1
    //    for (int i = 0; i<20; i++) {
    //        NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
    //            NSLog(@"task is running %@ %d",[NSThread currentThread],i);
    //        }];
    //        [queue addOperation:op];
    //    }
    
    //2
//    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
//        for (int i = 0; i<20; i++) {
//            NSLog(@"task is running %@ %d",[NSThread currentThread],i);
//        }
//    }];
//    [queue addOperation:op];
    
    //3 同一个Operation在同一个线程
    for (int k = 0; k<3; k++) {
        NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
            for (int i = 0; i<5; i++) {
                NSLog(@"task is running %@ %d Operation=%d",[NSThread currentThread],i,k);
            }
        }];
         [queue addOperation:op];
    }
    [queue addOperationWithBlock:^{
        [self testLogOne];
    }];
    
}


-(void)NSBlockOperationDemo3{
    //队列(并发队列，异步执行)
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i<5; i++) {
            NSLog(@"task is running %@ %d ",[NSThread currentThread],i);
        }
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i<5; i++) {
            NSLog(@"task is running %@ %d ",[NSThread currentThread],i);
        }
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i<5; i++) {
//            sleep(3000);
            NSLog(@"task is running %@ %d ",[NSThread currentThread],i);
        }
    }];
    
      NSLog(@"task is running currentThread=%@",[NSThread currentThread]);
//    [queue addOperations:@[op1,op2,op3] waitUntilFinished:YES];
     [queue addOperations:@[op1,op2,op3] waitUntilFinished:NO];
     NSLog(@"currentThread=%@",[NSThread currentThread]);
    
}


-(void)NSBlockOperationDemo4{
   NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task1 is running %@",[NSThread currentThread]);
    }];
    
    [op1 addExecutionBlock:^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"task2 is running %@",[NSThread currentThread]);
    }];
    
    
    [op1 setCompletionBlock:^{
        NSLog(@"task3 is running %@",[NSThread currentThread]);
    }];
    
    [queue addOperation:op1];
}


#pragma mark NSInvocationOperation
-(void)NSInvocationOperationDemo1{
    //创建NSInvocationOperation
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task:) object:@(100)];
    //开启任务,不开线程
    [op start];
}

-(void)NSInvocationOperationDemo2{
    //队列(并发队列，异步执行)
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    for (int i = 0; i<20; i++) {
        NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task:) object:@(i)];
        [queue addOperation:op];
    }
}

#pragma mark NSOperationQueue
//最大并发数
-(void)NSOperationQueueDemo1{
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    [queue setMaxConcurrentOperationCount:2];
    for (int i = 0; i<20; i++) {
        NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(testLogOne) object:nil];
//        NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
//            for (int i = 0; i<5; i++) {
//                NSLog(@"task is running %@ %d ",[NSThread currentThread],i);
//            }
//        }];
        [queue addOperation:op];
//        [queue addOperations:@[op,op2]];
    }
}

//暂停 恢复 取消
-(void)NSOperationQueueDemo2{
    if (!_count) {
        for (int i = 0; i<9999999; i++) {
            [self.queue addOperationWithBlock:^{
                [self testLogOne];
            }];
        }
    } else if (_count==1 || _count==3){
        [self.queue setSuspended:YES];
    } else if (_count == 2){
          [self.queue setSuspended:NO];
    } else {
         [self.queue cancelAllOperations];
    }
    _count++;
}

//操作依赖
-(void)NSOperationQueueDemo3{
    NSBlockOperation *BQ1 = [NSBlockOperation blockOperationWithBlock:^{
         NSLog(@"登录 %@ %d ",[NSThread currentThread],1);
    }];
    NSBlockOperation *BQ2 = [NSBlockOperation blockOperationWithBlock:^{
         NSLog(@"付费 %@ %d ",[NSThread currentThread],2);
    }];
    NSBlockOperation *BQ3 = [NSBlockOperation blockOperationWithBlock:^{
         NSLog(@"下载 %@ %d ",[NSThread currentThread],3);
    }];
    NSBlockOperation *BQ4 = [NSBlockOperation blockOperationWithBlock:^{
         NSLog(@"看片 %@ %d ",[NSThread currentThread],4);
    }];
    
    [BQ2 addDependency:BQ1];
     [BQ3 addDependency:BQ2];
     [BQ4 addDependency:BQ3];
    
    [self.queue addOperations:@[BQ1,BQ2,BQ3] waitUntilFinished:NO];
    [[NSOperationQueue mainQueue] addOperation:BQ4];
    
}

-(NSOperationQueue *)queue{
    if(!_queue){
//        [NSOperationQueue mainQueue];
        _queue = [[NSOperationQueue alloc] init];
        _queue.maxConcurrentOperationCount = 2;
        //设置队列的优先级,优先级高的队列不一定比优先级低的队列先运行，有更多可能性被先执行到
        [_queue setQualityOfService:NSQualityOfServiceBackground];
    }
    return _queue;
}

-(void)task:(NSNumber *)number{
    NSLog(@"task is running  %@ %d",[NSThread currentThread],number.intValue);
}


#
- (void)testOne{
    for (int i=0; i< 10; i++) {
        NSLog(@"NSThread=%d,NSThread=%@",i,[NSThread currentThread]);
    }
}

- (void)testLogOne{
    for (int i=0; i< 10; i++) {
        NSLog(@"LOG==NSThread=%d,NSThread=%@",i,[NSThread currentThread]);
    }
}

@end
