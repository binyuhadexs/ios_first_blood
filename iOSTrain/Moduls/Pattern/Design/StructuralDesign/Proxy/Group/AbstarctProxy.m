//
//  AbstarctProxy.m
//  iOSTrain
//
//  Created by binyu on 2017/12/12.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "AbstarctProxy.h"
#import "AbstarctSpamMessages.h"
#import <objc/message.h>

@implementation AbstarctProxy

- (nullable NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    if ([self.delegate respondsToSelector:sel]) {
        return [self.delegate methodSignatureForSelector:sel];
    } else {
        AbstarctSpamMessages *message = [AbstarctSpamMessages sharedInstance];
        return [message methodSignatureForSelector:NSSelectorFromString(@"emptySpamMessages:withString:")];
        
    }
}

- (void)forwardInvocation:(NSInvocation *)invocation{
   SEL sel =  invocation.selector;
    if ([self.delegate respondsToSelector:sel]) {
        [invocation setTarget:self.delegate];
        [invocation invoke];
    } else {
        //  获取参数
        NSString *selectorString = NSStringFromSelector(invocation.selector);
        // 1.替换
        invocation.selector = NSSelectorFromString(@"emptySpamMessages:withString:");
        // 2.再次回去单例对象
        AbstarctSpamMessages *message = [AbstarctSpamMessages sharedInstance];
        // 3. 设置代理. 代理就是专门处理垃圾数据的一个对象
        [invocation setTarget:message];
        
        // 获取当前控制器的类(ContentProxy)
        const char *className = class_getName([self class]);
        NSArray *parmater = nil;
        NSString *str = @"121";
        
        // 判断代理
        if (self.delegate) {
            parmater = @[[NSString stringWithUTF8String:className], selectorString,str];
        } else {
            parmater = @[[NSString stringWithUTF8String:className], selectorString];
        }
        // 因为0 1 被两个隐式参数占用self,_cmd. 分别表示的是target和selector
        [invocation setArgument:&parmater atIndex:2];
        [invocation setArgument:&str atIndex:3];
        // 执行方法,派发消息
        [invocation invoke];
    }
}



@end
