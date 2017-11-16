//
//  BYNSThreadTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/12.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYNSThreadTestViewController.h"

@interface BYNSThreadTestViewController ()

/** 票 */
@property(assign,nonatomic)int tickets;
/** 锁  */
@property(nonatomic,strong)NSObject * lockObjc;

@property(assign,nonatomic,getter=isFinished)BOOL finished;

@property(atomic,strong)NSObject * myAtomic;

@end

@implementation BYNSThreadTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    [self createThread];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self exitDemo];
//    [self theadStatus];
    
//    [self testLock];
    [self testThreadMethod];
}

#pragma mark 创建线程 属性
- (void)createThread{
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(logTest) object:nil];
    [thread setName:@"one"];
    thread.threadPriority = 1;
    //优先级 从 0.0 -- 1.0  默认值 0.5
    /**  优先级翻转
     优先级 只是保证 CPU 调度的可能性会高!
     
     多线程目的:将耗时操作放在后台,不阻塞UI线程!
     建议:在开发的时候,不要修改优先级
     在多线程开发中,不要相信一次的运行结果!!
     */
    [thread start];
    
    
    //创建并启动线程
    [NSThread detachNewThreadWithBlock:^{
//        [NSThread sleepUntilDate:] ;
//        [NSThread sleepForTimeInterval:1]; //单位 秒
         NSLog(@"GOOD-----=%@",[NSThread currentThread]);
    }];
    
    [NSThread detachNewThreadSelector:@selector(logTest) toTarget:self withObject:nil];
    
    
    //隐式创建
    [self performSelectorInBackground:@selector(logTest) withObject:nil];
    
    
}

- (void)logTest{
    NSLog(@"GOOD--=%@",[NSThread currentThread]);
}


#pragma mark 线程状态
-(void)exitDemo{
    [self performSelectorInBackground:@selector(starMainThread) withObject:nil];
    //注意!!! exit会杀掉主线程!但是APP不会挂掉!!
    [NSThread exit];
}

-(void)starMainThread{
    [NSThread sleepForTimeInterval:1.0];
    //开启主线程!!
    [[NSThread mainThread] start];//attempt to start the thread again
}


-(void)theadStatus{
    for (int i = 0; i < 20;i++) {
        //阻塞,当运行满足某个条件,会让线程"睡一会"
        //提示:sleep 方法是类方法,会直接休眠当前线程!!
        if (i == 8) {
            NSLog(@"睡一会");
            [NSThread sleepForTimeInterval:2.0];
        }
        NSLog(@"%@  %d",[NSThread currentThread],i);
        
        //当线程满足某一个条件时,可以强行终止的
        //exit 类方法,哥么终止当前线程!!!!
        if (i == 15) {
            //一旦强行终止线程,后续的所有代码都不会被执行
            //注意:在终止线程执行啊,应该要释放之前分配的对象!!
            [NSThread exit];
        }
    }
    NSLog(@"能来吗???");
}

#pragma mark 互斥锁
- (void)testLock{
     self.tickets = 20;
    self.lockObjc = [NSObject new];
    
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicks) object:nil];
    thread1.name = @"A";
    
    [thread1 start];
    
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicks) object:nil];
    thread2.name = @"B";
    
    [thread2 start];
    
}

//互斥锁 - 保证锁内的代码,同一时间,只有一条线程能够执行!!
//互斥锁它的范围,应该尽量小,锁范围越大,效率越低!
- (void)saleTicks{
    while (YES) {
        [NSThread sleepForTimeInterval:1.0];
//        NSObject * lockObj = [[NSObject alloc]init];
        //参数:就是能够加锁的任意 NSOjbect 对象
        //局部变量: 每个线程单独拥有的,无法锁住!!
        //注意: 锁一定要是所有线程共享的对象!!
        @synchronized(self.lockObjc){
            if (self.tickets > 0) {
                self.tickets--;
                NSLog(@"剩下 %d 张票 --- %@",self.tickets,[NSThread currentThread]);
            } else {
                NSLog(@"没票了");
                break;
            }
        }
    }
}

#pragma mark 线程间通信
- (void)testThreadMessage{
    [self performSelectorOnMainThread:@selector(logTest) withObject:nil waitUntilDone:NO];
    [self performSelectorInBackground:@selector(logTest) withObject:nil];
    [self performSelector:@selector(logTest) onThread:[NSThread mainThread] withObject:nil waitUntilDone:NO];
}

#pragma mark 原子属性
/*  原子属性
 atomic    : 原子属性  如果不写关键字 那么默认就是 原子属性
 - 多线程写入属性时,保证同一时间只有一个线程能够执行写入操作
 - 单(线程)写多(线程)读线程技术,同样有可能出现"脏数据",重新读一下
 
 * 线程安全
 在多个线程进行读写操作的时候,仍然能够保证数据正确
 
 * UI线程(主线程) : 共同一个约定,所有更新UI的操作都在主线程上执行!
 原因:几乎所有的UIKit 都不是线程安全的!"取舍"为了性能!
 
 */

/*
 一下代码模拟 Atomic  仅供参考!
 
 OC 中定义属性,通常会声明一个  _成员变量 (这个功能是Xcode 的功能!)
 如果你同时重写了属性的 getter & setter 方法, _成员变量,就不会自动生成!
 
 @synthesize 合成指令, 在Xcode 4.5 之前用得非常多!Xcode 4.5 之前属性不会自动生成 _成员变量
 */

@synthesize myAtomic = _myAtomic;
-(NSObject *)myAtomic
{
    return _myAtomic;
}

/**
 实际上,原子属性内部就有一把锁!! 自旋锁
 自旋锁 & 互斥锁
 
 - 共同点
 都能保证同一个时间点就只有一条线程访问!
 - 不同点
 互斥锁:如果发现有其他线程正在执行锁定的代码,线程就会进入睡眠状态,等待其他线程执行完毕,打开锁之后,线程就会被唤醒!
 自旋锁:如果发现有其他线程正在执行锁定的代码,线程就会用死循环的方式,一直等待锁定代码执行完毕!
 自旋锁更适合执行非常短的代码!
 
 无论什么锁,都是以"性能"作为代价来保证"安全"
 */

-(void)setMyAtomic:(NSObject *)myAtomic
{
    @synchronized (self) {
        _myAtomic = myAtomic;
    }
}

#pragma mark 显示网络图片

#pragma mark 定时器
//注意: 不能在时钟调用方法中,执行耗时操作!

#pragma mark 结束runloop
//如何结束runloop
- (void)testThreadMethod{
    //
    NSThread * t1 = [[NSThread alloc]initWithTarget:self selector:@selector(demo) object:nil];
    [t1 start];
    
    self.finished = NO;
    
    //不执行地方原因,是因为 demo 方法执行的快!""
    [self performSelector:@selector(otherMethod) onThread:t1 withObject:nil waitUntilDone:NO];
}


-(void)demo{
    NSLog(@"%@",[NSThread currentThread]);
    //启动当前RunLoop  哥么就是一个死循环!!
    //使用这种方式,可以自己创建一个线程池!
    //    [[NSRunLoop currentRunLoop] run];
    
    //在OC中使用比较多的,退出循环的方式!
    while (!self.isFinished) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    }
    NSLog(@"能来吗???");
}
-(void)otherMethod{
    for (int i = 0; i<10; i++) {
        
        NSLog(@"%s %@",__FUNCTION__,[NSThread currentThread]);
    }
    self.finished = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
