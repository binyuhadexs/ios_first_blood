//
//  BYGCDTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/13.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYGCDTestViewController.h"

@interface BYGCDTestViewController ()

@end

@implementation BYGCDTestViewController

/*
 队列
 dispatch_get_main_queue 主队列  == 串行队列
 dispatch_get_global_queue //全局队列 --
 dispatch_queue_create
 
 同步函数
 dispatch_sync 等block行完成
 异步函数
 dispatch_async 会开启子线程
 
 ？？同步函数 异步函数 队列 实现原理
 
 同步的场景：
 同步任务,能够做到,任务依赖关系,前一个任务不执行完成,队列就不会调度后面的任务
 
 */

//dispatch_get_global_queue : 全局队列 (本质上就是并发)
/*
参数:
1.涉及到系统适配:
iOS 8       服务质量
- QOS_CLASS_USER_INTERACTIVE                        用户交互(用户迫切希望线程快点)
- QOS_CLASS_USER_INITIATED                          用户需要的(同样不要使用耗时操作)
- QOS_CLASS_DEFAULT                                 默认的(给系统用来重置队列的)
- QOS_CLASS_UTILITY                                 实用工具(用来做耗时操作的)
- QOS_CLASS_BACKGROUND                              后台
- QOS_CLASS_UNSPECIFIED                             没有指定优先级
iOS 7       调度的优先级
- DISPATCH_QUEUE_PRIORITY_HIGH 2                    高优先级
- DISPATCH_QUEUE_PRIORITY_DEFAULT 0                 默认优先级
- DISPATCH_QUEUE_PRIORITY_LOW (-2)                  低优先级
- DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN      后台优先级
因为我们项目大部分考虑 适配 iOS7 & iOS8 & iOS9 无法使用 服务质量,直接指定 0.
友情提示:不要使用 BACKGROUND 优先级&服务质量 ,速度慢得令人发指!!
2.为未来使用保留的,应该 传入 0
*/

//dispatch_once 为什么只执行一次？？

/**
GCD 核心概念:将任务添加到队列,指定任务执行的方法
- 任务
- 使用block 封装
- block 就是一个提前准备好的代码块,在需要的时候执行
- 队列(负责调度任务)
- 串行队列: 一个接一个的调度任务
- 并发队列: 可以同时调度多个任务
- 任务执行函数(任务都需要在线程中执行!!)
- 同步执行: 不会到线程池里面去获取子线程!
- 异步执行: 只要有任务,哥么就会到线程池取子线程!(主队列除外!)
小结:
- 开不开线程,取决于执行任务的函数,同步不开,异步才能开
- 开几条线程,取决于队列,串行开一条,并发可以开多条(异步)
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dispatch_syncDemo];
//    [self dispatch_asyncDemo];
//    [self gcdDemo2];
//    [self gcdDemo8];
}

//同步执行方法,这句话不执行完,就不会执行下一个任务,同步执行不会开启线程
//同步函数
- (void)dispatch_syncDemo{
    //     dispatch_queue_t queue =  dispatch_get_main_queue(); //主队列 + 同步函数 ： 死锁 ？？ 为什么？？
    
    /*
     第一个参数:队列的优先级DISPATCH_QUEUE_PRIORITY_DEFAULT
     第二个参数:永远传0
     */
//    dispatch_queue_t queue =  dispatch_get_global_queue(0, 0); //全局队列 + + 同步函数
    /*
     第一个参数:C语言字符串,标签
     第二个参数:
     DISPATCH_QUEUE_CONCURRENT:并发队列
     DISPATCH_QUEUE_SERIAL:串行队列
     */
    dispatch_queue_t queue =  dispatch_queue_create("com.hiwifi", DISPATCH_QUEUE_SERIAL);//串行列 + 同步函数 = 当前线程同步执行  DISPATCH_QUEUE_SERIAL= NULL
//    dispatch_queue_t queue =  dispatch_queue_create("com.hiwifi", DISPATCH_QUEUE_CONCURRENT);//并行列 + 同步函数 = 串行列 + 同步函数 --->同步函数中 串行队列和并行队列一样
    dispatch_sync(queue, ^{
        [self testOne];
    });
    

//    dispatch_async(queue,^{
//        NSLog(@"---download1---%@",[NSThread currentThread]);
//    });
    
    
    dispatch_sync(queue,^{
        NSLog(@"---download2---%@",[NSThread currentThread]);
    });
    [self testLogOne];
}

//不用等待,异步执行下一个任务，具备开启线程的能力
//异步函数
- (void)dispatch_asyncDemo{
    dispatch_queue_t queue =  dispatch_get_global_queue(0, 0); //全局队列 + 异步函数 == 并发
//     dispatch_queue_t queue =  dispatch_get_main_queue();// 主队列 + 异步函数 == 串行 --->串行
//   dispatch_queue_t queue =  dispatch_queue_create("com.hiwifi", DISPATCH_QUEUE_SERIAL);//串行列 +异步函数 = 只开一个子线程
//    dispatch_queue_t queue =  dispatch_queue_create("com.hiwifi", DISPATCH_QUEUE_CONCURRENT);//并行列 + 异步函数
    
    dispatch_async(queue, ^{
        [self testOne];
    });
    dispatch_async(queue,^{
        NSLog(@"---download1---%@",[NSThread currentThread]);
    });
    dispatch_sync(queue,^{ //等着前面任务执行
        NSLog(@"---download2---%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        [self testOne];
    });
    [self testLogOne];
}

//串行队列
- (void)dispatch_syncDemo1{
    dispatch_queue_t queue =  dispatch_queue_create(0, 0);
    dispatch_sync(queue, ^{
        [self testOne];
    });
    [self testLogOne];
}


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

// MARK: 串行队列       ,异步任务
//问题:   顺序执行么?    会开几条线程
//猜测:   会               2
-(void)gcdDemo2{
    dispatch_queue_t q = dispatch_queue_create("tanzhou", NULL);
    
    for (int i = 0; i < 10; i++) {
        NSLog(@"%d--------",i);
        dispatch_async(q, ^{
            NSLog(@"%@  %d",[NSThread currentThread],i);
        });
    }
    NSLog(@"come here");
}

//MARK : 增强版GCD
/*
 - 异步任务,会在主线程方法执行完成后,被调度
 - 同步任务,会造成死锁
 */
-(void)gcdDemo8{
    //并发
    dispatch_queue_t  q = dispatch_queue_create("tanzhou", DISPATCH_QUEUE_CONCURRENT);
    //任务
    void (^tast)() = ^{
        //1.用户登录,必须第一个执行
        dispatch_sync(q, ^{
            [NSThread sleepForTimeInterval:3];
            NSLog(@"用户登录  %@",[NSThread currentThread]);
        });
        //2.扣费
        dispatch_async(q, ^{
            NSLog(@"扣费  %@",[NSThread currentThread]);
        });
        //3.下载
        dispatch_sync(q, ^{
            [NSThread sleepForTimeInterval:3.0];
            NSLog(@"下载  %@",[NSThread currentThread]);
        });
        //4.看电影
        dispatch_async(q, ^{
            NSLog(@"看电影  %@",[NSThread currentThread]);
        });
        
    };
    dispatch_async(q, tast);
    //    dispatch_release(q);
}


@end
