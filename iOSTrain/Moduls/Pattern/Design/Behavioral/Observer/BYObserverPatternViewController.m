//
//  BYObserverPatternViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/30.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYObserverPatternViewController.h"
#import "BYWorker.h"
#import "SubProtocol.h"
#import "SubCenter.h"

@interface BYObserverPatternViewController ()<SubProtocol>

@property (nonatomic,strong) BYWorker *worker;

@end

/*
 观察者模式
 意图：定义对象间的一种一对多的依赖关系，当一个对象的状态发生改变时，所有依赖于它的对象都得到通知并被自动更新。
 主要解决：一个对象状态改变给其他对象通知的问题，而且要考虑到易用和低耦合，保证高度的协作。
 何时使用：一个对象（目标对象）的状态发生改变，所有的依赖对象（观察者对象）都将得到通知，进行广播通知。
 如何解决：使用面向对象技术，可以将这种依赖关系弱化。
 优点： 1、观察者和被观察者是抽象耦合的。 2、建立一套触发机制。
 缺点： 1、如果一个被观察者对象有很多的直接和间接的观察者的话，将所有的观察者都通知到会花费很多时间。 2、如果在观察者和观察目标之间有循环依赖的话，观察目标会触发它们之间进行循环调用，可能导致系统崩溃。 3、观察者模式没有相应的机制让观察者知道所观察的目标对象是怎么发生变化的，而仅仅只是知道观察目标发生了变化。
 
 */

@implementation BYObserverPatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //KVO
//    self.worker = [[BYWorker alloc] init];
//    self.worker.name = @"ABC";
//
//    [self.worker addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionInitial| NSKeyValueObservingOptionNew context:nil];
    
    
    [SubCenter creatNumber:@"string1"];
    // 添加订阅
    [SubCenter addUser:self wihtNumber:@"string1"];
    // 发送消息
    [SubCenter sendMessage:@"11" withSubNumber:@"string1"];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     self.worker.name = @"ABC1";
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@的值改变了,",keyPath);
    NSLog(@"change:%@", change);
}

- (void)dealloc{
    [self.worker removeObserver:self forKeyPath:@"name"];
}

//KVO 使用
- (void)KVOdemo{
    
}

#pragma mark SubProtocol
- (void)subMessage:(id)message withSubNumber:(NSString *)withSubNumber {
    NSLog(@"----%@----%@",message, withSubNumber);
}

@end
