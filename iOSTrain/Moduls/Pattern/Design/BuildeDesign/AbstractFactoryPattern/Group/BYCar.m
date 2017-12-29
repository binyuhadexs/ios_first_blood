//
//  BYCar.m
//  iOSTrain
//
//  Created by binyu on 2017/12/6.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYCar.h"


@implementation BYCar

+ (instancetype)buildeCarEngine:(Engine *) engine tyre:(Tyre *)tyre{
    BYCar *car = [[BYCar alloc] init];
    car.engine = engine;
    car.tyre = tyre;
    return car;
}

- (void)work{
    [self.engine send];
    [self.tyre run];
    NSLog(@"BYCar 开始起航");
}

@end
