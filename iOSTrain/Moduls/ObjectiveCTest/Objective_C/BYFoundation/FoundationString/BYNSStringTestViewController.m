//
//  BYNSStringTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/10/28.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYNSStringTestViewController.h"
#import <objc/runtime.h>
#import "BYWebPramaWrapper.h"

@interface BYNSStringTestViewController ()

@property (nonatomic,strong) BYWebPramaWrapper *wrapper;

@end

@implementation BYNSStringTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.wrapper = [[BYWebPramaWrapper alloc] init];
    
    [self test];
    [self abc];
    [self abcd:@"abcd"];
}

#pragma -mark NSString
- (void)test{
    NSString *str1 = @"abc";
    [str1 writeToFile:@"" atomically:YES encoding:NSUTF8StringEncoding error:nil];
     NSLog(@"NSString encoding type: %s", @encode(typeof(str1)));
    NSLog(@"NSString encoding type: %s", @encode(NSString));
//    NSLog(@"");
    NSMutableString *mutStr = @"123";

}


- (void)creatMethodTest{
     NSString *str1 = @"abc";
     NSString *str2 =[[NSString alloc] init];
//    NSString *str3 = [];

}
void functionAbc(id self,SEL _cmd){
    NSLog(@"%@,%p",self,_cmd);
}

//class_getMethodImplementation


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
//    else if (sel == @selector(abcd:)){ class_addMethod(self.class,sel,class_getMethodImplementation(self,@selector(abcdefg:)),"s@:@");
//        return YES;
//    }
    
    return [super resolveInstanceMethod:sel];
}


- (id)forwardingTargetForSelector:(SEL)aSelector{
    if (@selector(abcd:) == aSelector) {
//        return _wrapper;
    }
    return [super forwardingTargetForSelector:aSelector];
}

//
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


//常用方法


//




@end
