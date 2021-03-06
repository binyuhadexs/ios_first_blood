//
//  DarkerCommand.h
//  iOSTrain
//
//  Created by binyu on 2017/12/25.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommandProtocol.h"
#import "Receiver.h"

@interface DarkerCommand : NSObject<CommandProtocol>
// 绑定接收器
- (instancetype)initWithReceiver:(Receiver *)receiver paramter:(CGFloat)paramter;


@end
