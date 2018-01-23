//
//  BYRACTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/18.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYRACTestViewController.h"
#import "ReactiveObjC.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
#import "BYWorker.h"
#import "NetworkTools.h"


#define NUMBER 10
#define ADD(a,b) (a + b)

#define STRINGIFY(S) #S


#define CALCILATE(A,B) _CALCILATE(A,B) //轉換宏
#define _CALCILATE(A,B) (A##10##B)

/*
 http://blog.leichunfeng.com/blog/2015/11/08/functor-applicative-and-monad/
 http://blog.leichunfeng.com/blog/2015/12/25/reactivecocoa-v2-dot-5-yuan-ma-jie-xi-zhi-jia-gou-zong-lan/
 
 */

/*
 ReactiveCocoa
 
 ReactiveCocoa5.0以后将 RAC 拆分为四个库：ReactiveCocoa、ReactiveSwift、ReactiveObjC、ReactiveObjCBridge。其中的ReactiveCocoa和ReactiveObjC
 
 */

@interface BYRACTestViewController ()
@property (weak, nonatomic) IBOutlet UIButton *submit;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic,strong) BYWorker *worker;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField2;

@end

@implementation BYRACTestViewController

/*
 
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    [self demo1];
//     [self demo2];
//    [self demo3];
//    [self demo4];
    NSLog(@"%s",metamacro_stringify(101));
    
//
//        NSLog(@"%d + %d = %d", NUMBER, NUMBER , ADD(NUMBER, NUMBER));
//        NSLog(@"int max = %s",STRINGIFY(INT_MAX));
//
//    NSLog(@"int max = %s",metamacro_stringify(INT_MAX));
//    NSLog(@"%d",CALCILATE(NUMBER,NUMBER));
    
//    [DDLog addLogger:[DDTTYLogger sharedInstance]]; // TTY = Xcode console
//    [DDLog addLogger:[DDASLLogger sharedInstance]]; // ASL = Apple System Logs
//
//    DDFileLogger *fileLogger = [[DDFileLogger alloc] init]; // File Logger
//    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
//    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
//    [DDLog addLogger:fileLogger];
    
    
    self.worker = [[BYWorker alloc] init];
    [self KVODemo];
    
     NSLog(@"%d", metamacro_argcount(@"1",@(2),@"121"));
//    NSLog(@"%d", metamacro_at(@"1",@(2),@"121",@(1211)));
    

    
//    [self combineSignal];
    
    [self combinReduce];
}

- (void)demo4{
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIApplicationDidEnterBackgroundNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        NSLog(@"==%@",x);
    }];
}

- (void)demo3{
    [[self.submit rac_signalForControlEvents: UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
         NSLog(@"==%@",x);
    }];
}

- (void)demo2{
    @weakify(self)
    [[self.textField rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"%@",x);
        @strongify(self);
        self.textField.text = @"Hello";
    }];
}

- (void)demo1{
    RACSignal *racsignal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"XXXXXXXXXX");
        [subscriber sendNext:@"xxxx"];
        return nil;
    }];
    
    [racsignal subscribeNext:^(id  _Nullable x) {
        NSLog(@"XXXXXXXXXX==%@",x);
    }];
    
    
    [[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        return nil;
    }] subscribeNext:^(id  _Nullable x) {
        
    }];
}


//TODO
-(void)KVODemo{
    [RACObserve(self.worker, name) subscribeNext:^(id  _Nullable x) {
        self.label.text = x;
    }];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.worker.name = [NSString stringWithFormat:@"Vergil %05d",arc4random_uniform(10000)];
    
//    [self demoNetworking];
    
    
}

-(void)dealloc{
    NSLog(@"88");
}


-(void)demoNetworking{
    [[[NetworkTools sharedTools] request:@"http://www.weather.com.cn/data/sk/101010100.html" parameters:nil] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@ %@",x,[x class]);
    } error:^(NSError * _Nullable error) {
        NSLog(@"%@",error);
    }];
}

- (void)combineSignal{
    //RACTuple 元组
    [[RACSignal combineLatest:@[self.textField.rac_textSignal, self.textField2.rac_textSignal]] subscribeNext:^(RACTuple * _Nullable x) {
        //        NSLog(@"%@,%@",x,[x class]);
        
        NSString * name = x.first;
        NSString * pwd = x.second;
        NSLog(@"%@ ,%@", name,pwd);
        
    }];
}

- (void)combinReduce{
    [[RACSignal combineLatest:@[self.textField.rac_textSignal, self.textField2.rac_textSignal] reduce:^id _Nullable(NSString * name, NSString * pwd){
        
//        NSLog(@"%@ ,%@", name,pwd);
        return @(name.length > 0 && pwd.length > 0);
        return nil;
    }] subscribeNext:^(id  _Nullable x) {
        _submit.enabled = [x boolValue];
    }];
}



@end
