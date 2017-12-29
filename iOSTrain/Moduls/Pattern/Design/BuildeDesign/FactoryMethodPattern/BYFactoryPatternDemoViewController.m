//
//  BYFactoryPatternDemoViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/12/6.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYFactoryPatternDemoViewController.h"
#import "BMWCarFactory.h"

/*
 工厂方法
 封装类中不变的部分，提取其中个性化善变的部分为独立类，通过依赖注入以达到解耦、复用和方便后期维护拓展的目的
 四个角色：抽象工厂；具体工厂；抽象产品；具体产品
 
 工厂方法将代码修改放到客户端
 */

@interface BYFactoryPatternDemoViewController ()

@end


@implementation BYFactoryPatternDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BMWCarFactory *factory =  [[BMWCarFactory alloc] init];
    Car *car = [factory createCar];
    [car run];
    
}



@end
