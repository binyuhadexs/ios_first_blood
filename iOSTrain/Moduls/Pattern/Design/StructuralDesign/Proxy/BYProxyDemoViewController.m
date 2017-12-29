//
//  BYProxyDemoViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/12/12.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYProxyDemoViewController.h"
#import "ContentProxy.h"

/*
 代理模式
 意图：为其他对象提供一种代理以控制对这个对象的访问。
 
 */

/*
 // 消息转发
 - (id)forwardingTargetForSelector:(SEL)aSelector OBJC_AVAILABLE(10.5, 2.0, 9.0, 1.0);
 
 // 标准的消息转发
 - (void)forwardInvocation:(NSInvocation *)anInvocation OBJC_SWIFT_UNAVAILABLE("");
 
 - (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector OBJC_SWIFT_UNAVAILABLE("");
 
 // 动态方法解析
 + (BOOL)resolveClassMethod:(SEL)sel OBJC_AVAILABLE(10.5, 2.0, 9.0, 1.0);
 + (BOOL)resolveInstanceMethod:(SEL)sel OBJC_AVAILABLE(10.5, 2.0, 9.0, 1.0);
 
 //
 doesNotRecognizeSelector
 */



@interface BYProxyDemoViewController ()

@end

@implementation BYProxyDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ContentProxy *proxy = [ContentProxy alloc];
    proxy.delegate = self;
    [proxy helloWorld];
    
//    [proxy abc];
    
    
}

- (void)helloWorld{
    NSLog(@"----helloWorld----");
}



@end
