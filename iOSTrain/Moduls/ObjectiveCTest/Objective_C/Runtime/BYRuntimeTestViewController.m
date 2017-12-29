//
//  BYRuntimeTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/18.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYRuntimeTestViewController.h"
#import "Boy.h"
#import "Boy+EatingChange.h"
#import <objc/message.h>
#import "BYWebPramaWrapper.h"


/*
 Rumtime
 //
 1、对象模型
 http://blog.leichunfeng.com/blog/2015/04/25/objective-c-object-model/
 http://www.jianshu.com/p/17e158a666b1
 
 属性 objc_property_t
 
2、消息转发机制
  objc_msgSend(id,SEL ,...);
 
 objc_cache --> objc_method_list
 --> 所属类动态方法解析
 + (BOOL)resolveInstanceMethod:(SEL)name (所属类)
 + (BOOL)resolveClassMethod:(SEL)sel
 --> 备援接收者
- (id)forwardingTargetForSelector:(SEL)aSelector;
 -- >消息重定向
 - (void)forwardInvocation:(NSInvocation *)anInvocation
 --> 无法处理消息
 (NSObject)doesNotRecognizeSelector:
 
 
 1、方法交换
 2、关联对象
 3、动态添加方法
 
 IMP
 
 
 */


/*
 id  typedef struct objc_object *id;
 
 */

@interface BYRuntimeTestViewController ()
@property (nonatomic,strong) BYWebPramaWrapper *wrapper;
@end

@implementation BYRuntimeTestViewController

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     self.wrapper = [[BYWebPramaWrapper alloc] init];
//    [self test];
    
    [self exchangeMethod];
//    [self AssociatedObjectDemo];
    
//    NSLog(@"%s",(@selector(test)));
    
    
    [self abc];
    [self abcd:@"abcd"];
    
}


- (void)test{
    Boy *boy = [[Boy alloc]init];
    objc_msgSend(boy,@selector(eatWithFoot:),@"土豆");
    //OC 调用类方法
//        [Boy run];
    Class boyClass = [Boy class];
//    [boyClass performSelector:@selector(run)];
    //运行时
    objc_msgSend(boyClass, @selector(run));
}

/*
 method_exchangeImplementations
 方法交换原理
 
 */
- (void)exchangeMethod{
    Boy *boy = [[Boy alloc]init];
    [boy eating];
    [boy drink];
    [boy run];
    [Boy run];
    
    [boy exchange_eating];
    
}

/*
 关联对象
 objc_setAssociatedObject
 objc_getAssociatedObject
 objc_removeAssociatedObjects
 
 http://blog.leichunfeng.com/blog/2015/06/26/objective-c-associated-objects-implementation-principle/
 */
- (void)AssociatedObjectDemo{
    Boy *boy = [[Boy alloc]init];
    boy.associatedObjectStr = @"123567";
    
    NSLog(@"%@",boy.associatedObjectStr);
    [boy removeAssociatedObjectStr];
    NSLog(@"removeAssociatedObjectStr=%@",boy.associatedObjectStr);
}


void functionAbc(id self,SEL _cmd){
    NSLog(@"%@,%p",self,_cmd);
}

- (void)abcdefg:(NSString *)abc{
    NSLog(@"abc=%@",abc);
}


+ (BOOL)resolveClassMethod:(SEL)sel{
    return NO;
}


+(BOOL)resolveInstanceMethod:(SEL)sel{
    NSString *selectorStr = NSStringFromSelector(sel);
    if ([selectorStr isEqualToString:@"abc"]) {
        class_addMethod(self.class,@selector(abc),(IMP)functionAbc,"@:");
        return YES;
    }
//     else if (sel == @selector(abcd:)){ class_addMethod(self.class,sel,class_getMethodImplementation(self,@selector(abcdefg:)),"s@:@");
//        return YES;
//     }
    
    return [super resolveInstanceMethod:sel];
}


//- (id)forwardingTargetForSelector:(SEL)aSelector{
//    if (@selector(abcd:) == aSelector) {
//        return _wrapper;
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}



- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        if ([BYWebPramaWrapper instancesRespondToSelector:aSelector] ) {
            signature = [BYWebPramaWrapper instanceMethodSignatureForSelector:aSelector];
        }
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    if ([BYWebPramaWrapper instancesRespondToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:_wrapper];
    }
}

@end
