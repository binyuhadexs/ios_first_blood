//
//  BYRunloopTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/20.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYRunloopTestViewController.h"

//http://www.cocoachina.com/ios/20150601/11970.html

/*
 http://www.imlifengfeng.com/blog/?p=487
 Runloop
 1、保证了程序的持续运行
 2、响应各种事件
 3、节省CPU资源，提高效率
 
 NSRunLoop  -- Fundation
 CFRunLoopRef -- CoreFoundation
 
 
 runloop优化图片加载
 
 */

/*
 模式
 1. kCFRunLoopDefaultMode：App的默认Mode，通常主线程是在这个Mode下运行
 2. UITrackingRunLoopMode：界面跟踪 Mode，用于 ScrollView 追踪触摸滑动，保证界面滑动时不受其他 Mode 影响
 3. UIInitializationRunLoopMode: 在刚启动 App 时第进入的第一个 Mode，启动完成后就不再使用
 4. GSEventReceiveRunLoopMode: 接受系统事件的内部 Mode，通常用不到
 5. kCFRunLoopCommonModes: 这是一个占位用的Mode，作为标记kCFRunLoopDefaultMode和UITrackingRunLoopMode用，并不是一种真正的Mode
 */

/*
 CFRunLoopSourceRef
 ource0：非基于Port的 用于用户主动触发的事件（点击button 或点击屏幕）
 Source1：基于Port的 通过内核和其他线程相互发送消息（与内核相关）
 注意：Source1在处理的时候会分发一些操作给Source0去处理
 
 */


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

//定义一个block
typedef BOOL(^RunloopBlock)(void);

static NSString *IDENTIFIER = @"IDENTIFIER";

static CGFloat CELL_HEIGHT = 135.f;

@interface BYRunloopTestViewController ()<UITableViewDataSource, UITableViewDelegate>

/** 存放任务的数组  */
@property(nonatomic,strong)NSMutableArray * tasks;
/** 任务标记  */
@property(nonatomic,strong)NSMutableArray * tasksKeys;
/** 最大任务数 */
@property(assign,nonatomic)NSUInteger max;


/** timer  */
@property(nonatomic,strong)NSTimer * timer;

@property (nonatomic, strong) UITableView *exampleTableView;

@property (nonatomic,assign) BOOL finish;

@end

@implementation BYRunloopTestViewController


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self changeModel];
//      [self observeDemo];
  
//    [UIApplication sharedApplication].notif;
    
    //     [NSThread exit]; 程序继续运行，UI没有响应，UIKit运行在主线程。进程还在
    
    //    [self testThread];
}

- (void)changeModel{
    // [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(show) userInfo:nil repeats:YES];
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(show) userInfo:nil repeats:YES];
    // 加入到RunLoop中才可以运行
    // 1. 把定时器添加到RunLoop中，并且选择默认运行模式NSDefaultRunLoopMode = kCFRunLoopDefaultMode
    // [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    // 当textFiled滑动的时候，timer失效，停止滑动时，timer恢复
    // 原因：当textFiled滑动的时候，RunLoop的Mode会自动切换成UITrackingRunLoopMode模式，因此timer失效，当停止滑动，RunLoop又会切换回NSDefaultRunLoopMode模式，因此timer又会重新启动了
    
    // 2. 当我们将timer添加到UITrackingRunLoopMode模式中，此时只有我们在滑动textField时timer才会运行
    // [[NSRunLoop mainRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
    
    // 3. 那个如何让timer在两个模式下都可以运行呢？
    // 3.1 在两个模式下都添加timer 是可以的，但是timer添加了两次，并不是同一个timer
    // 3.2 使用站位的运行模式 NSRunLoopCommonModes标记，凡是被打上NSRunLoopCommonModes标记的都可以运行，下面两种模式被打上标签
    //0 : <CFString 0x10b7fe210 [0x10a8c7a40]>{contents = "UITrackingRunLoopMode"}
    //2 : <CFString 0x10a8e85e0 [0x10a8c7a40]>{contents = "kCFRunLoopDefaultMode"}
    // 因此也就是说如果我们使用NSRunLoopCommonModes，timer可以在UITrackingRunLoopMode，kCFRunLoopDefaultMode两种模式下运行
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    NSLog(@"%@",[NSRunLoop mainRunLoop]);
    
}

- (void)show{
      NSLog(@"%@",@"show---");
}

- (void)observeDemo{
    //创建监听者
    /*
     第一个参数 CFAllocatorRef allocator：分配存储空间 CFAllocatorGetDefault()默认分配
     第二个参数 CFOptionFlags activities：要监听的状态 kCFRunLoopAllActivities 监听所有状态
     第三个参数 Boolean repeats：YES:持续监听 NO:不持续
     第四个参数 CFIndex order：优先级，一般填0即可
     第五个参数 ：回调 两个参数observer:监听者 activity:监听的事件
     */
    /*
     所有事件
     typedef CF_OPTIONS(CFOptionFlags, CFRunLoopActivity) {
     kCFRunLoopEntry = (1UL << 0),   //   即将进入RunLoop
     kCFRunLoopBeforeTimers = (1UL << 1), // 即将处理Timer
     kCFRunLoopBeforeSources = (1UL << 2), // 即将处理Source
     kCFRunLoopBeforeWaiting = (1UL << 5), //即将进入休眠
     kCFRunLoopAfterWaiting = (1UL << 6),// 刚从休眠中唤醒
     kCFRunLoopExit = (1UL << 7),// 即将退出RunLoop
     kCFRunLoopAllActivities = 0x0FFFFFFFU
     };
     */
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"RunLoop进入");
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"RunLoop要处理Timers了");
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"RunLoop要处理Sources了");
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"RunLoop要休息了");
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"RunLoop醒来了");
                break;
            case kCFRunLoopExit:
                NSLog(@"RunLoop退出了");
                break;
                
            default:
                break;
        }
    });
    
    // 给RunLoop添加监听者
    /*
     第一个参数 CFRunLoopRef rl：要监听哪个RunLoop,这里监听的是主线程的RunLoop
     第二个参数 CFRunLoopObserverRef observer 监听者
     第三个参数 CFStringRef mode 要监听RunLoop在哪种运行模式下的状态
     */
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
    /*
     CF的内存管理（Core Foundation）
     凡是带有Create、Copy、Retain等字眼的函数，创建出来的对象，都需要在最后做一次release
     GCD本来在iOS6.0之前也是需要我们释放的，6.0之后GCD已经纳入到了ARC中，所以我们不需要管了
     */
    CFRelease(observer);
}

#pragma RUNLOOP Demo

-(void)_timerFiredMethod{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.exampleTableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.exampleTableView.delegate = self;
    self.exampleTableView.dataSource = self;
    [self.view addSubview:self.exampleTableView];
    
    _max = 30;
    _tasks = [NSMutableArray array];
    _tasksKeys = [NSMutableArray array];
    
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(_timerFiredMethod) userInfo:nil repeats:YES];
    
    //注册Cell
    [self.exampleTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:IDENTIFIER];
    
    //注册监听
    [self addRunloopObserver];
    
}

//MARK: 内部实现方法
//加载第一张
+(void)addImage1With:(UITableViewCell *)cell{
    //第一张
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 20, 85, 85)];
    imageView.tag = 1;
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"spaceship" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:path1];//spaceship
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    [UIView transitionWithView:cell.contentView duration:0.3 options:(UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        [cell.contentView addSubview:imageView];
    } completion:nil];
}
//加载第二张
+(void)addImage2With:(UITableViewCell *)cell{
    //第二张
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(105, 20, 85, 85)];
    imageView1.tag = 2;
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"spaceship" ofType:@"png"];
    UIImage *image1 = [UIImage imageWithContentsOfFile:path1];
    imageView1.contentMode = UIViewContentModeScaleAspectFit;
    imageView1.image = image1;
    [UIView transitionWithView:cell.contentView duration:0.3 options:(UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        [cell.contentView addSubview:imageView1];
    } completion:nil];
}
//加载第三张
+(void)addImage3With:(UITableViewCell *)cell{
    //第三张
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 20, 85, 85)];
    imageView2.tag = 3;
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"spaceship" ofType:@"png"];
    UIImage *image2 = [UIImage imageWithContentsOfFile:path1];
    imageView2.contentMode = UIViewContentModeScaleAspectFit;
    imageView2.image = image2;
    [UIView transitionWithView:cell.contentView duration:0.3 options:(UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        [cell.contentView addSubview:imageView2];
    } completion:nil];
}

//MARK:  UI初始化方法
//设置tableview大小
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.exampleTableView.frame = self.view.bounds;
}

//Cell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CELL_HEIGHT;
}

//加载tableview
//- (void)loadView {
//    self.view = [UIView alloc] initWithFrame:CGRectMake(0, 0, , <#CGFloat height#>);
//    self.exampleTableView = [UITableView new];
//    self.exampleTableView.delegate = self;
//    self.exampleTableView.dataSource = self;
//    [self.view addSubview:self.exampleTableView];
//}

#pragma mark - <tableview>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 399;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IDENTIFIER];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //干掉contentView上面的子控件!! 节约内存!!
    for (NSInteger i = 1; i <= 3; i++) {
        //干掉contentView 上面的所有子控件!!
        [[cell.contentView viewWithTag:i] removeFromSuperview];
    }
    //不要直接加载图片!! 你将加载图片的代码!都给RunLoop!!
    [self addTask:^BOOL{
        [BYRunloopTestViewController addImage1With:cell];
        return YES;
    } withKey:indexPath];
    [self addTask:^BOOL{
        [BYRunloopTestViewController addImage2With:cell];
        return YES;
    } withKey:indexPath];
    [self addTask:^BOOL{
        [BYRunloopTestViewController addImage3With:cell];
        return YES;
    } withKey:indexPath];
    return cell;
}




#pragma mark - <RunLoop>

//MARK: 添加任务
-(void)addTask:(RunloopBlock)unit withKey:(id)key{
    [self.tasks addObject:unit];
    [self.tasksKeys addObject:key];
    //保证之前没有显示出来的任务,不再浪费时间加载
    if (self.tasks.count > self.max) {
        [self.tasks removeObjectAtIndex:0];
        [self.tasksKeys removeObjectAtIndex:0];
    }
    
}



//MARK: 回调函数
//定义一个回调函数  一次RunLoop来一次
static void Callback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    BYRunloopTestViewController * vc = (__bridge BYRunloopTestViewController *)(info);
    if (vc.tasks.count == 0) {
        return;
    }
    BOOL result = NO;
    while (result == NO && vc.tasks.count) {
        //取出任务
        RunloopBlock unit = vc.tasks.firstObject;
        //执行任务
        result = unit();
        //干掉第一个任务
        [vc.tasks removeObjectAtIndex:0];
        //干掉标示
        [vc.tasksKeys removeObjectAtIndex:0];
    }
    
}

//这里面都是C语言 -- 添加一个监听者
-(void)addRunloopObserver{
    //获取当前的RunLoop
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    //定义一个centext
    CFRunLoopObserverContext context = {
        0,
        ( __bridge void *)(self),
        &CFRetain,
        &CFRelease,
        NULL
    };
    //定义一个观察者
    static CFRunLoopObserverRef defaultModeObsever;
    //创建观察者
    defaultModeObsever = CFRunLoopObserverCreate(NULL,
                                                 kCFRunLoopBeforeWaiting,
                                                 YES,
                                                 NSIntegerMax - 999,
                                                 &Callback,
                                                 &context
                                                 );
    
    //添加当前RunLoop的观察者
    CFRunLoopAddObserver(runloop, defaultModeObsever, kCFRunLoopDefaultMode);
    //c语言有creat 就需要release
    CFRelease(defaultModeObsever);
    
}


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

#pragma mark - Runloop
- (void)addRunloopObserverTest{
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
