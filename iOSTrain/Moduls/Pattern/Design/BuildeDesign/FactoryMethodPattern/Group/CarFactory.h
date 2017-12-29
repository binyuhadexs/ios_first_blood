//
//  CarFactory.h
//  iOSTrain
//
//  Created by binyu on 2017/12/6.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYObject.h"
#import "Car.h"

@interface CarFactory : BYObject

- (Car *)createCar;

@end
