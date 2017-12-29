//
//  MacComputerBuilder.m
//  iOSTrain
//
//  Created by binyu on 2017/12/19.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "MacComputerBuilder.h"
#import "MacComputerProtocol.h"
#import "MACComputer.h"
#import "MacBuilder.h"

@interface MacComputerBuilder ()
@property (nonatomic, strong) id<MacComputerProtocol> computer;
@end

@implementation MacComputerBuilder

- (instancetype)init
{
    self = [super init];
    if (self) {
        _computer = [[MACComputer alloc] init];
    }
    return self;
}

// 构建CPU
- (id<MacBuilder>)buildCPU:(NSString *)cpu {
    [_computer cpu:cpu];
    return self;
}

// 构建显卡
- (id<MacBuilder>)buildDisplay:(NSString *)display {
    [_computer display:display];
    return self;
}

// 构建主板
- (id<MacBuilder>)buildMainboard:(NSString *)mainboard {
    [_computer mainboard:mainboard];
    return self;
}

// 构建系统
- (id<MacBuilder>)buildOS:(NSString *)os {
    [_computer os:os];
    return self;
}

// 构建
- (id<MacComputerProtocol>)build {
    NSLog(@"构建了一台苹果电脑");
    //这种中间其实有很多逻辑需要处理，此次省略500行代码
    
    return _computer;
}

@end
