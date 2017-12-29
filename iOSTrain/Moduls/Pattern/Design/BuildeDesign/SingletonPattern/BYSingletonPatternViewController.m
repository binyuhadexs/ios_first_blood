//
//  BYSingletonPatternViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/12/6.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYSingletonPatternViewController.h"
#import "Singleton.h"
/*
 单例模式
 
 注意
 
 */
@interface BYSingletonPatternViewController ()

SingletonH(BYSingletonPatternViewController)

@end

@implementation BYSingletonPatternViewController

SingletonM(BYSingletonPatternViewController)

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    Singleton *singleton =  [Singleton sharedSingleton];
    NSLog(@"%@",singleton);
    NSLog(@"%@",[BYSingletonPatternViewController sharedBYSingletonPatternViewController]);
}


@end
