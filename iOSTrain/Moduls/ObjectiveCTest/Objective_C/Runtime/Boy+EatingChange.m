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

-(NSString *)associatedObjectStr{
    return objc_getAssociatedObject(self,@"associatedObjectStr");
//    return objc_getAssociatedObject(self,"associatedObjectStr");
//    return objc_getAssociatedObject(self,@selector(associatedObject_retain));
}

/*
 OBJC_ASSOCIATION_ASSIGN = 0, //弱引用，对象销毁不会造成关联对象的引用计数变化
 OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1, //强引用，不支持多线程安全
 OBJC_ASSOCIATION_COPY_NONATOMIC = 3, //深拷贝，不支持多线程安全
 OBJC_ASSOCIATION_RETAIN = 01401, //强引用支持线程安全
 OBJC_ASSOCIATION_COPY = 01403  //深拷贝，支持线程安全
 
 */
-(void)setAssociatedObjectStr:(NSString *)associatedObject_retain{
    objc_setAssociatedObject(self, @"associatedObjectStr", associatedObject_retain, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    objc_setAssociatedObject(self, "associatedObjectStr", associatedObject_retain, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    objc_setAssociatedObject(self, @selector(associatedObject_retain), associatedObject_retain, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)removeAssociatedObjectStr{
    objc_removeAssociatedObjects(self);
}


@end
