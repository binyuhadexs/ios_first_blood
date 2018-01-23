//
//  LoginViewModel.h
//  iOSTrain
//
//  Created by binyu on 2018/1/5.
//  Copyright © 2018年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveObjC.h"


@interface LoginViewModel : NSObject

@property(nonatomic, strong) NSString * account;
@property(nonatomic, strong) NSString * pwd;

@property(nonatomic, strong) RACSignal * loginEnableSignal;

@property(nonatomic, strong) RACCommand * loginCommand;



@end
