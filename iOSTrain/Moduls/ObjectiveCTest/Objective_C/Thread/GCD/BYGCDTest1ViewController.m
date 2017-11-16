//
//  BYGCDTest1ViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/13.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYGCDTest1ViewController.h"

@interface BYGCDTest1ViewController ()

@property (nonatomic, strong) UIImage  *image1; /**< 图片1 */
@property (nonatomic, strong) UIImage  *image2; /**< 图片2 */
@property (nonatomic, weak) UIImageView  *imageview;


@end

/*
 GCD文档
 */

/*
 
 dispatch_once
 dispatch_after
 dispatch_apply  //多次执行
 dispatch_barrier_sync  dispatch_barrier_async
 dispatch_group_async

 
 */


@implementation BYGCDTest1ViewController


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self apply];
//    [self barrier];
//    [self group];
//    [self suspend];
    
//    [self semaphore];
    [self dispatchSource];
}

//http://www.jianshu.com/p/ef3f77c8b320
#pragma mark - 单例
-(void)once{
    static dispatch_once_t onceToken; //
    NSLog(@"%ld", onceToken);
    dispatch_once(&onceToken, ^{
        NSLog(@"%ld", onceToken);
        NSLog(@"+++++++++");//保证代码在程序运行中执行一次
        //        objc_retainedObject(<#o#>)
        //        objc_re
    });
    NSLog(@"%ld", onceToken);
    onceToken = 0; //???
    NSLog(@"%ld", onceToken);
    dispatch_once(&onceToken,^{
         NSLog(@"+++++++++");//保证代码在程序运行中执行一次
    });
    
}

#pragma mark - 延时执行
-(void)delay
{
    //dispatch_time_t
    NSLog(@"----");
    //表名2秒钟之后调用run
    // 1   [self performSelector:@selector(run) withObject:nil afterDelay:2.0];
    
    //   2 [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    
    /*
     第一个参数:延迟时间
     第二个参数:要执行的代码
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
        NSLog(@"---%@",[NSThread currentThread]);
    });
    
    
}


-(void)apply
{
    //        for (NSInteger i=0; i<10; i++) {
    //            NSLog(@"%zd--%@",i,[NSThread currentThread]);
    //        }
    
    //创建队列(并发队列)
//        dispatch_queue_t queue = dispatch_queue_create("com.downloadqueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue =  dispatch_get_global_queue(0, 0);
    
    /*
     第一个参数:迭代的次数
     第二个参数:在哪个队列中执行
     第三个参数:block要执行的任务
     */
    NSLog(@"%zd--%@",11,[NSThread currentThread]);
    dispatch_apply(10, queue, ^(size_t index) {
        wait(1000);
        NSLog(@"%zd--%@",index,[NSThread currentThread]); //index顺序不定
    });
    NSLog(@"%zd--%@",12,[NSThread currentThread]);
}


/*
 栅栏函数
 dispatch_barrier_sync  dispatch_barrier_async
  //http://www.jianshu.com/p/9ed95082f256
 */
-(void)barrier
{
    //1.创建队列(并发队列)
    dispatch_queue_t queue = dispatch_queue_create("com.downloadqueue", DISPATCH_QUEUE_CONCURRENT);
//     dispatch_queue_t queue = dispatch_queue_create("com.downloadqueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i<10; i++) {
            NSLog(@"%zd-download1--%@",i,[NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i<10; i++) {
            NSLog(@"%zd-download2--%@",i,[NSThread currentThread]);
        }
    });
    
    
    //栅栏函数 dispatch_barrier_sync  dispatch_barrier_async
   //http://www.jianshu.com/p/9ed95082f256
//    dispatch_barrier_async(queue, ^{
//        NSLog(@"我是一个栅栏函数");
//    });
    dispatch_barrier_sync(queue, ^{
        NSLog(@"我是一个栅栏函数"); //等待前面任务执行完成 阻塞线程
    });
    
     NSLog(@"我是一个good boy");
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i<10; i++) {
            NSLog(@"%zd-download3--%@",i,[NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i<10; i++) {
            NSLog(@"%zd-download4--%@",i,[NSThread currentThread]);
        }
    });
}


/*
     dispatch_group_async
     dispatch_group_notify
    dispatch_group_leave(group);调用leave时计数减1
    dispatch_group_enter(group);//enter时计数加1
    dispatch_group_wait ????
 //    dispatch_group_enter + dispatch_async + dispatch_group_leave = dispatch_group_async;

 */

//一组耗时异步操作，等都结束时在执行一个操作
-(void)group
{
   
    //创建队列组
    dispatch_group_t group =  dispatch_group_create();
    
    //1.开子线程下载图片
    //创建队列(并发)
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_group_async(group, queue, ^{
        NSURL *url = [NSURL URLWithString:@"http://www.huabian.com/uploadfile/2015/0914/20150914014032274.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        self.image1 = [UIImage imageWithData:data];
        
        NSLog(@"1---%@",self.image1);
    });
//    dispatch_group_async_f(group, queue, void * _Nullable context, dispatch_function_t  _Nonnull work)
    
    
    dispatch_group_async(group, queue, ^{
        NSURL *url = [NSURL URLWithString:@"http://img1.3lian.com/img2011/w12/1202/19/d/88.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        self.image2 = [UIImage imageWithData:data];
        NSLog(@"2---%@",self.image2);
        
        //起作用
//        dispatch_group_wait(group, dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)));
        
    });
    
    /*调用enter时计数加1，调用leave时计数减1*/
//    dispatch_group_leave(group);
//    dispatch_group_enter(group);
//     dispatch_group_wait(group, dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)));
//     NSLog(@"阻塞了----");
    //dispatch_group_wait
    //合成
    dispatch_group_notify(group, queue, ^{
//        dispatch_group_wait(group, dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)));
        
        //开启图形上下文
        UIGraphicsBeginImageContext(CGSizeMake(200, 200));
        [self.image1 drawInRect:CGRectMake(0, 0, 200, 100)];
        [self.image2 drawInRect:CGRectMake(0, 100, 200, 100)];
        //根据图形上下文拿到图片
        UIImage *image =  UIGraphicsGetImageFromCurrentImageContext();
        //关闭上下文
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *imageview=[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200,200)];
            self.imageview = imageview;
            [self.view addSubview:imageview];
            self.imageview.image = image;
            [self.imageview sizeToFit];
            NSLog(@"%@--刷新UI",[NSThread currentThread]);
        });
    });
    
//    dispatch_release(group); ARC 模式下不用调用
    
//    dispatch_group_enter + dispatch_async + dispatch_group_leave = dispatch_group_async;
    
//    dispatch_group_enter(group);
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        //模拟延时
//        [NSThread sleepForTimeInterval:arc4random_uniform(3)];
//        NSLog(@"2. LOL2.zip %@",[NSThread currentThread]);
//        dispatch_group_leave(group);
//    });
}


//- (UIImageView *)imageview{
//    if (!_imageview) {
//        _imageview=[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200,200)];
//    }
//    return _imageview;
//}

/*
 dispatch_suspend  挂起队列
 dispatch_resume  恢复队列
 
 挂起队列后如果不恢复队列 程序会卡死
 */
- (void)suspend{
    dispatch_queue_t queue =  dispatch_queue_create("com.hiwifi", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i<10; i++) {
            if (i == 5) {
                 dispatch_resume(queue);
            }
            NSLog(@"%zd-download1--%@",i,[NSThread currentThread]);
        }
        dispatch_resume(queue); //多次调用会挂
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i<10; i++) {
            NSLog(@"%zd-download3--%@",i,[NSThread currentThread]);
        }
    });
    dispatch_suspend(queue); //一次suspend 对应一次resume
    dispatch_suspend(queue); //dispatch_resume 后会执行后续队列任务
    NSLog(@"----GOOD");
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i<10; i++) {
            NSLog(@"%zd-download2--%@",i,[NSThread currentThread]);
        }
    });
}


/*
 信号
 dispatch_semaphore_create
 dispatch_semaphore_wait
 dispatch_semaphore_signal
 //http://blog.csdn.net/yxys01/article/details/51579804
 */
- (void)semaphore{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    NSLog(@"线程----：%@",[NSThread currentThread]);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        dispatch_async(queue, ^{
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER); //dispatch_semaphore_t 等到 semaphore >=1
            //dispatch_semaphore_t 的值为0
            [array addObject:[NSNumber numberWithInt:i]]; //线程安全
            NSLog(@"线程：%@",[NSThread currentThread]);
            //排他控制处理结束 semaphore 的值增加1
            dispatch_semaphore_signal(semaphore); //不释放会导致死锁
        });
    }
    NSLog(@"线程---=：%@",[NSThread currentThread]);
}

/*
 Dispatch Sources ???
 source
 */
- (void)dispatchSource{
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    //
    dispatch_source_set_timer(timer,dispatch_time(DISPATCH_TIME_NOW, 1ull*NSEC_PER_SEC) , DISPATCH_TIME_FOREVER,1ull*NSEC_PER_SEC );
    
    dispatch_source_set_event_handler(timer, ^{
        NSLog(@"handler---=：%@",[NSThread currentThread]);
        
        dispatch_source_cancel(timer);
    });
    
    dispatch_source_set_cancel_handler(timer, ^{
        NSLog(@"canceled---=：%@",[NSThread currentThread]);
        
    });
    
    dispatch_resume(timer);
    
}

/*
 dispatch_set_target_queue
 http://blog.csdn.net/yxys01/article/details/51577151
 */
- (void)set_target_queue{

//    dispatch_set_target_queue();
}

/*
 读取大文件
 dispatch_io_t
 */
- (void)dispatchIoData{
    //    dispatch_io_create(<#dispatch_io_type_t type#>, <#dispatch_fd_t fd#>, <#dispatch_queue_t queue#>, <#^(int error)cleanup_handler#>);
    //    dispatch_io_set_low_water(<#dispatch_io_t channel#>, <#size_t low_water#>)
    //    dispatch_io_set_high_water(<#dispatch_io_t channel#>, <#size_t high_water#>)
    //    dispatch_io_read(<#dispatch_io_t channel#>, <#off_t offset#>, <#size_t length#>, <#dispatch_queue_t queue#>, <#^(bool done, dispatch_data_t data, int error)io_handler#>)
    //    dispatch_io_write(<#dispatch_io_t channel#>, <#off_t offset#>, <#dispatch_data_t data#>, <#dispatch_queue_t queue#>, <#^(bool done, dispatch_data_t data, int error)io_handler#>)
    //    dispatch_data_create(<#const void *buffer#>, <#size_t size#>, <#dispatch_queue_t queue#>, <#^(void)destructor#>)
    //    dispatch_continuation_t 结构体 用于记忆Block执行上下文，
}


- (void)dispatchIo{
//    dispatch_io_t
//    dispatch_data_t
//    dispatch_block_t
//    dispatch_source_t
//    dispatch_cancel(<#object#>)
//    dispatch_activate(<#dispatch_object_t  _Nonnull object#>)、
//
//    dispatch_introspection_hook
    
}

@end
