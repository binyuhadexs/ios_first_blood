//
//  Employee.m
//  iOSTrain
//
//  Created by binyu on 2017/12/17.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "Employee.h"

@implementation Employee

- (instancetype)init{
    self = [super init];
    if (self) {
        self.subordinates = [NSMutableArray array];
    }
    return self;
}


@end
