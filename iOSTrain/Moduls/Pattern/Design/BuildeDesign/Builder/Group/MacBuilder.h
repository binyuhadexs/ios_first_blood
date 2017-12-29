//
//  MacBuilder.h
//  iOSTrain
//
//  Created by binyu on 2017/12/19.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MacComputerProtocol.h"

@protocol MacBuilder <NSObject>

// 构建CPU
- (id<MacBuilder>)buildCPU:(NSString *)cpu;

// 构建显卡
- (id<MacBuilder>)buildDisplay:(NSString *)display;

// 构建主板
- (id<MacBuilder>)buildMainboard:(NSString *)mainboard;

// 构建系统
- (id<MacBuilder>)buildOS:(NSString *)os;

// 构建
- (id<MacComputerProtocol>)build;

@end
