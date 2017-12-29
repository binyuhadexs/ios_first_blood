//
//  MACComputer.m
//  iOSTrain
//
//  Created by binyu on 2017/12/19.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "MACComputer.h"

@implementation MACComputer

// 处理器
- (void)cpu:(NSString *)cpu {
    NSLog(@"Mac电脑处理器:%@",cpu);
}

// 显卡
- (void)display:(NSString *)display {
    NSLog(@"Mac电脑显卡:%@",display);
}

// 主板
- (void)mainboard:(NSString *)mainboard {
    NSLog(@"Mac电脑主板:%@",mainboard);
    
}

// 系统
- (void)os:(NSString *)version{
    NSLog(@"MAC系统:%@",version);
}
@end
