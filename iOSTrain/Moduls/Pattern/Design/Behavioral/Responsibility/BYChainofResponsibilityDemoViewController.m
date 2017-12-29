//
//  BYChainofResponsibilityDemoViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/12/19.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYChainofResponsibilityDemoViewController.h"
#import "FileLogger.h"
#import "ErrorLogger.h"
#import "ConsoleLogger.h"
#import "AbstractLogger.h"



/*
 责任链模式
 
 意图：避免请求发送者与接收者耦合在一起，让多个对象都有可能接收请求，将这些对象连接成一条链，并且沿着这条链传递请求，直到有对象处理它为止。
 主要解决：职责链上的处理者负责处理请求，客户只需要将请求发送到职责链上即可，无须关心请求的处理细节和请求的传递，所以职责链将请求的发送者和请求的处理者解耦了。
 何时使用：在处理消息的时候以过滤很多道。
 如何解决：拦截的类都实现统一接口。
 
 UIResponder
 
 */
@interface BYChainofResponsibilityDemoViewController ()

@end

@implementation BYChainofResponsibilityDemoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    AbstractLogger *loger =[self getChainLoger];
    [loger logMessage:@"LevelFile" level:LevelFile];
    [loger logMessage:@"LevelConsole" level:LevelConsole];
}

- (AbstractLogger *)getChainLoger{
    AbstractLogger *loger1 = [[FileLogger alloc] init];
    loger1.level = LevelFile;
    AbstractLogger *loger2 = [[ErrorLogger alloc] init];
    loger2.level = LevelError;
    AbstractLogger *loger3 = [[ConsoleLogger alloc] init];
    loger3.level = LevelConsole;
    loger3.nextLogger =loger2;
    loger2.nextLogger =loger1;
    return loger3;
}



@end
