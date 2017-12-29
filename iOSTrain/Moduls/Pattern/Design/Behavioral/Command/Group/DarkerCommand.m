//
//  DarkerCommand.m
//  iOSTrain
//
//  Created by binyu on 2017/12/25.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "DarkerCommand.h"

@interface DarkerCommand ()
@property (nonatomic, strong) Receiver *receiver;
@property (nonatomic, assign) CGFloat paramter;

@end


@implementation DarkerCommand

- (instancetype)initWithReceiver:(Receiver *)receiver paramter:(CGFloat)paramter {
    self = [super init];
    if (self) {
        self.receiver = receiver;
        self.paramter = paramter;
    }
    return self;
}

// 执行命令
- (void)excute {
    [self.receiver mackeDarker:self.paramter];
}

// 撤销命令
- (void)backExcute {
    [self.receiver mackeLighter:self.paramter];
}


@end
