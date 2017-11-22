//
//  BYMemoryTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/21.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYMemoryTestViewController.h"
#import "BYPersionCopy.h"
#import <objc/runtime.h>

@interface BYMemoryTestViewController ()

@property (nonatomic,strong) BYPersionCopy *persion;
@end

/*
 内存管理
 引用计数内存管理思考方式：
 自己生成的对象自己持有  生成对象 alloc new copy mutableCopy 持有对象 retain
 非自己生成的对象也可以持有  array
 不需要自己持有的对象时释放  release
 非自己持有的对象无法释放    dealloc
 
 alloc 做了三件事：分配内存、初始化值0、返还地址
 

 集合中添加对象，集合会将对象retain一次，移除对象，或者集合释放将对所有对象release
 
 
 
 
 */

/*
 copy strong 的区别
 
 */

/*
 获取对象的引用计数
 MRC可以直接获取对象的引用计数 obj.retainCount
 ARC下引用计数由编译器自动管理
 CFGetRetainCount((__bridge CFTypeRef)(obj));
 */

@implementation BYMemoryTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.persion = [[BYPersionCopy alloc] init];
    CFIndex count2 =  CFGetRetainCount((__bridge CFTypeRef)(_persion));
    NSLog(@"retainCount=%d",count2);
}

//TODO 



@end
