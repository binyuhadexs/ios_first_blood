//
//  BYRunloopTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/12.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYRunloopTestViewController.h"

@interface BYRunloopTestViewController ()


/*
 //http:www.cocoachina.com/ios/20150601/11970.html
 https:blog.ibireme.com/2015/05/18/runloop/
 
 http:blog.csdn.net/u011619283/article/details/53483965
 
 https:developer.apple.com/library/content/documentation/Cocoa/Conceptual/Multithreading/RunLoopManagement/RunLoopManagement.html
 
*/
/*
 为什么UI在主线程
 如果多线程，必然会出现锁 -- 抢夺资源 -- 性能下降
 UI操作不涉及多线程，就没有这个问题。统一在主线程中修改UI
 
 source 事件源
 
 */

@property (nonatomic,assign) BOOL finish;

@end

@implementation BYRunloopTestViewController

- (void) testRunloop{
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(runCallback) userInfo:nil repeats:YES];
//        、、 // NSEventTrackingRunLoopMode
        //UITrackingRunLoopMode NSRunLoopCommonModes NSDefaultRunLoopMode
        
        
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        //        [[NSRunLoop currentRunLoop] run]; //常驻线程 线程一直运行
        
        [NSRunLoop currentRunLoop];
        
        while (!_finish) {
            [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.000001]];
        }
        NSLog(@"GOGOGO");
        
    }];
    
    [thread start];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //     [[NSRunLoop currentRunLoop] addTimer:nil forMode:NSDefaultRunLoopMode];
    //    [[NSRunLoop currentRunLoop] addTimer:nil forMode:UITrackingRunLoopMode];
    
//    [self testRunloop];
    
    //
    
    //将timer添加到runloop中 并开启runloop
    [NSTimer scheduledTimerWithTimeInterval:0.0001 target:self selector:@selector(runCallback) userInfo:nil repeats:YES];
    CFRunLoopRef loop =   CFRunLoopGetCurrent();
    static CFRunLoopObserverRef observer;
    CFRunLoopObserverContext context = {
        0,
        (__bridge void *)(self),
        &CFRetain,
        &CFRelease,
        NULL
    };
    
    observer =  CFRunLoopObserverCreate(NULL,kCFRunLoopBeforeWaiting , YES, 0, &callBack, &context);
    CFRunLoopAddObserver(loop, observer, kCFRunLoopDefaultMode);//kCFRunLoopCommonModes
    
}



static void callBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    NSLog(@"---来了");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _finish = YES;
    
//     [NSThread exit]; 程序继续运行，UI没有响应，UIKit运行在主线程。进程还在
    
//    [self testThread];
}

//线程间通信也是一个事件，交给runloop处理
- (void)testThread{
    NSThread *T = [[NSThread alloc] initWithBlock:^{
        NSLog(@"----%@",[NSThread currentThread]);
        while (true) {
           [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.0001]];
        }
        
    }];
    [T start];
    [self performSelector:@selector(runCallback) onThread:T withObject:nil waitUntilDone:NO];
}




- (void)runCallback{
//    if (_finish) {
//        [NSThread exit]; 退出当前线程
//    }
    
    NSLog(@"------%@",[NSThread currentThread]);
}

@end
