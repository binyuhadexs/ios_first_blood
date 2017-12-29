//
//  AbstractLogger.m
//  iOSTrain
//
//  Created by binyu on 2017/12/19.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "AbstractLogger.h"

@implementation AbstractLogger

- (void)logMessage:(NSString *)message level:(Level)level{
    if(self.level == level){
        [self write:message];
    } else if(self.nextLogger){
        [self.nextLogger logMessage:message level:level];
    }
}

-(void)write:(NSString *)message{
    NSLog(@"write---");
}

@end
