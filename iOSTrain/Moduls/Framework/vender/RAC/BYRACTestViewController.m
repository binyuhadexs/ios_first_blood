//
//  BYRACTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/18.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYRACTestViewController.h"
#import "ReactiveObjC.h"

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

@end

@implementation BYRACTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    [self demo1];
//     [self demo2];
//    [self demo3];
//    [self demo4];
    NSLog(@"%s",metamacro_stringify(101));
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


@end
