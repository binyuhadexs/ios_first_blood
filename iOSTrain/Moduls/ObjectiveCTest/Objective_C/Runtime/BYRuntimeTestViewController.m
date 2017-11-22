//
//  BYRuntimeTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/18.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYRuntimeTestViewController.h"
#import "Boy.h"
#import "Boy+EatingChange.h"
#import <objc/message.h>

@interface BYRuntimeTestViewController ()

@end

@implementation BYRuntimeTestViewController

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    [self test];
    
    [self exchangeMethod];
}


- (void)test{
    Boy *boy = [[Boy alloc]init];
    objc_msgSend(boy,@selector(eatWithFoot:),@"土豆");
    //OC 调用类方法
//        [Boy run];
    Class boyClass = [Boy class];
//    [boyClass performSelector:@selector(run)];
    //运行时
    objc_msgSend(boyClass, @selector(run));
}


- (void)exchangeMethod{
    Boy *boy = [[Boy alloc]init];
    [boy eating];
    [boy drink];
    
    [boy exchange_eating];
    
}


@end
