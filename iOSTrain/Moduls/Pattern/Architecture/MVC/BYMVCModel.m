//
//  BYMVCModel.m
//  iOSTrain
//
//  Created by binyu on 2017/12/2.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYMVCModel.h"

@implementation BYMVCModel

+ (BYMVCModel *)getUser{
    BYMVCModel *mode = [[BYMVCModel alloc] init];
    mode.age = arc4random_uniform(100);
    mode.name = [NSString stringWithFormat:@"BYMVCModel_%ld",mode.age];
    return mode;
}

- (void)changeName:(NSString *)name{
    self.name = name;
    NSLog(@"%@",self.name);
    //模拟数据
}

- (void)changeName:(NSString *)name result:(void(^)(NSString *))result{
    self.name = name;
    NSLog(@"%@",self.name);
    //模拟数据
    NSString *LOG =@"操作成功";
    if (result) {
        result(LOG);
    }
}

- (NSString *)description{
    return [NSString stringWithFormat:@"name=%@,age=%ld",self.name,self.age];
}

@end
