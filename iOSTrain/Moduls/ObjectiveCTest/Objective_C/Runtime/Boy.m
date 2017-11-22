//
//  Boy.m
//  iOSTrain
//
//  Created by binyu on 2017/11/19.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "Boy.h"
#import <objc/message.h>

@implementation Boy

+(void)run{
    NSLog(@"跑起来");
}

-(void)run{
    NSLog(@"run -----ing");
}


-(void)eatWithFoot:(NSString *)foot{
    NSLog(@"吃%@，好开心",foot);
}

/***方法交换**/
//+(void)load{
//    Method methodDrink =  class_getInstanceMethod([Boy class], @selector(drink));
//    Method methodEating =  class_getInstanceMethod([Boy class], @selector(eating));
//    method_exchangeImplementations(methodDrink, methodEating);
//}

-(void)drink{
    NSLog(@"drink -----ing");
}

-(void)eating{
    NSLog(@"eating -----ing");
}

-(void)study{
     NSLog(@"study -----ing");
}
@end
