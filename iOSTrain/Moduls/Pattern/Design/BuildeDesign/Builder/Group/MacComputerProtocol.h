//
//  MacComputerProtocol.h
//  iOSTrain
//
//  Created by binyu on 2017/12/19.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MacComputerProtocol <NSObject>

// 处理器
- (void)cpu:(NSString *)cpu;

// 显卡
- (void)display:(NSString *)display;

// 主板
- (void)mainboard:(NSString *)mainboard;

// 系统
- (void)os:(NSString *)version;

@end
