//
//  ErrorLogger.m
//  iOSTrain
//
//  Created by binyu on 2017/12/19.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "ErrorLogger.h"

@implementation ErrorLogger

-(void)write:(NSString *)message{
    NSLog(@"Error:%@",message);
}


@end
