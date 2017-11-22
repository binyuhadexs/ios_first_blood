//
//  Boy+EatingChange.m
//  iOSTrain
//
//  Created by binyu on 2017/11/19.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "Boy+EatingChange.h"
#import <objc/message.h>

@implementation Boy (EatingChange)


+(void)load{
//    Method methodDrink =  class_getInstanceMethod([Boy class], @selector(drink));
//    Method methodEating =  class_getInstanceMethod([Boy class], @selector(eating));
//    method_exchangeImplementations(methodDrink, methodEating);
//
//    Method methodStudy =  class_getInstanceMethod([Boy class], @selector(study));
//    Method methodEatingChange =  class_getInstanceMethod([Boy class], @selector(exchange_eating));
//    method_exchangeImplementations(methodStudy, methodEatingChange);
}

-(void)exchange_eating{
    NSLog(@"eating -----exchange_eating");
}

@end
