//
//  CommandProtocol.h
//  iOSTrain
//
//  Created by binyu on 2017/12/25.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CommandProtocol <NSObject>

// 执行命令
- (void)excute;

// 撤销命令
- (void)backExcute;

@end
