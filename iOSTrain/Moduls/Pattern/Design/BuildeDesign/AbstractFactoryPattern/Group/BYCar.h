//
//  BYCar.h
//  iOSTrain
//
//  Created by binyu on 2017/12/6.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Engine.h"
#import "Tyre.h"


@interface BYCar : NSObject

@property (nonatomic,strong) Engine *engine;
@property (nonatomic,strong) Tyre *tyre;

+ (instancetype)buildeCarEngine:(Engine *) engine tyre:(Tyre *)tyre;
- (void)work;

@end
