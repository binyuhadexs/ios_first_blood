//
//  BYAbstractFactoryDemoViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/12/6.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYAbstractFactoryDemoViewController.h"
#import "BMWAutopartsFactory.h"
#import "SZAutopartsFactory.h"
#import "BYCar.h"


/*
 抽象
 多个产品
 
 */

@interface BYAbstractFactoryDemoViewController ()

@end

@implementation BYAbstractFactoryDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BMWAutopartsFactory *BMWF =  [[BMWAutopartsFactory alloc] init];
    BYCar *car =  [BYCar buildeCarEngine:[BMWF buildEngine] tyre:[BMWF buildTyre]];
    [car work];
    SZAutopartsFactory *szf =  [[SZAutopartsFactory alloc] init];
    car.tyre = [szf buildTyre];
    [car work];
}


@end
