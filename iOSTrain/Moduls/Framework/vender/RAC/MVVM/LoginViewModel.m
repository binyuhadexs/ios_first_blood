//
//  LoginViewModel.m
//  iOSTrain
//
//  Created by binyu on 2018/1/5.
//  Copyright © 2018年 binyu. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel
-(instancetype) init{
    if (self = [super init]) {
        [self setUP]; //  初始化
    }
    
    return self;
}

-(void)setUP{
    
    _loginEnableSignal = [RACSignal combineLatest:@[RACObserve(self, account), RACObserve(self, pwd)] reduce:^id _Nullable(NSString * account, NSString * pwd){
        
        return @(account.length && pwd.length);
    }];
    
    //登录提交
    _loginCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            
            if ([@"123" isEqualToString: self.account]
                || [@"123" isEqualToString: self.pwd]) {
                 [subscriber sendNext:@"登录成功"];
            } else {
                 [subscriber sendNext:@"用户名或密码错误"];
            }
            [subscriber sendCompleted];
            return nil;
        }];
    }];
    
    [[_loginCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        
        if ([x boolValue]){
            NSLog(@"提示等待");
        }else{
            NSLog(@"移除等待");
        }
    }];
    
    [_loginCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }]; // 執行命令
    
    
}

@end
