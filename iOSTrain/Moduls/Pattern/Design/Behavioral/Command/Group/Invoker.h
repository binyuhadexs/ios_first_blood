//
//  Invoker.h
//  iOSTrain
//
//  Created by binyu on 2017/12/25.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommandProtocol.h"

@interface Invoker : NSObject

+ (instancetype)sharedInstance;

- (void)addAndExcute:(id <CommandProtocol>)command;

- (void)goBack;

@end
