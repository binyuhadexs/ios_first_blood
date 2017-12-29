//
//  ConsoleLogger.m
//  iOSTrain
//
//  Created by binyu on 2017/12/19.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "ConsoleLogger.h"

@implementation ConsoleLogger

-(void)write:(NSString *)message{
    NSLog(@"Console:%@",message);
}

@end
