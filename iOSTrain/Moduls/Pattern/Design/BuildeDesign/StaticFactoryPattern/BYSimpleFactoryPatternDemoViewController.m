//
//  BYSimpleFactoryPatternDemoViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/12/6.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYSimpleFactoryPatternDemoViewController.h"
#import "ShapeFactory.h"

/*
 简单工厂
 工厂方法模式的一种特例  违反开闭原则
 简单工厂模式是工厂模式家族中最简单实用的模式，可以理解为是不同工厂模式的一个特殊实现。
 
 https://baike.baidu.com/item/%E7%AE%80%E5%8D%95%E5%B7%A5%E5%8E%82%E6%A8%A1%E5%BC%8F/8801727?fr=aladdin
 
 工厂类
 
 */
@interface BYSimpleFactoryPatternDemoViewController ()

@end

@implementation BYSimpleFactoryPatternDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BYShape *Circle = [ShapeFactory shapeFactory:kCircle];
    [Circle draw];
    BYShape *rectange = [ShapeFactory shapeFactory:kRectangle];
    [rectange draw];
    BYShape *Square = [ShapeFactory shapeFactory:kSquare];
    [Square draw];
    
    BYShape *rectange2 =  [ShapeFactory createShape:@"Rectangle"];
    [rectange2 draw];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)demo2{
    NSNumber *num = [[NSNumber alloc] init];
    
    NSNumber *intNum = [NSNumber numberWithInt:97];
    NSNumber *floatNum = [NSNumber numberWithFloat:1.0f];
    NSNumber *boolNum = [NSNumber numberWithBool:YES];
    
    NSLog(@"num = %@",[[num class] description]);
    
    NSLog(@"intNum = %@",[[intNum class] description]);
    NSLog(@"floatNum = %@",[[floatNum class] description]);
    NSLog(@"boolNum = %@",[[boolNum class] description]);
    
    NSLog(@"转化 = %c",[intNum charValue]);
}


@end
