//
//  BYMVPModel.m
//  iOSTrain
//
//  Created by binyu on 2017/12/3.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYMVPModel.h"

@implementation BYMVPModel


+ (BYMVPModel *)getUser{
    BYMVPModel *mode = [[BYMVPModel alloc] init];
    mode.age = arc4random_uniform(100);
    mode.name = [NSString stringWithFormat:@"BYMVPModel%ld",mode.age];
    return mode;
}

- (void)changeName:(NSString *)name{
    self.name = name;
    NSLog(@"%@",self.name);
    //模拟数据
}

- (NSString *)description{
    return [NSString stringWithFormat:@"name=%@,age=%ld",self.name,self.age];
}


@end
