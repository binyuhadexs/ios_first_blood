//
//  BYMVVMViewModel.m
//  iOSTrain
//
//  Created by binyu on 2017/12/3.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYMVVMViewModel.h"

@implementation BYMVVMViewModel

- (void)login{
    self.model = [BYMVVMModel getEntity];
    self.nameStr = self.model.name;
}

- (void)changeNmae{
    // 获取数据 并校验
    self.showLoading = @"showing";
    NSString *name = [NSString stringWithFormat:@"changeName_%d", arc4random_uniform(100)];
    __weak typeof(self) weakSelf = self;
    [self.model changeName:name result:^(NSString * name) {
        //        _nameStr = name;
        //         self.nameStr = name;
        weakSelf.nameStr = name;
        weakSelf.showLoading = @"hide";
    }];
    
}

@end
