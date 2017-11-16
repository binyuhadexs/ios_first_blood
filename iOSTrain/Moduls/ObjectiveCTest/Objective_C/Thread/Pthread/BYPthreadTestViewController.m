//
//  BYPthreadTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/12.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYPthreadTestViewController.h"
#import <pthread.h> //POSIX 多线程开发框架

@interface BYPthreadTestViewController ()

@end

@implementation BYPthreadTestViewController

/*
 pthread  跨平台 可移植
 */

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self pthreadTest];
}

/*
 参数:
 1.线程代号的地址
 2.线程的属性
 3.调用函数的指针
 4.传递给函数的参数
 返回值:
 - 如果是 0, 表示正确
 - 如果是非0,表示错误码
 
 void *--(*)--(void *)
 返回值--(函数指针)--(参数)
 
 void *  相当于 OC中的id
 
 */

- (void)pthreadTest{
    pthread_t threadID;
    NSString *str = @"good boy";
    int result = pthread_create(&threadID, NULL, &callback, (__bridge void *)(str));
    if (result == 0) {
        for (int i = 0; i < 20; i++) {
            NSLog(@"OK");
        }
    } else {
        NSLog(@"ERROR");
    }
}


void * callback(void *parms){
    NSString *input = (__bridge NSString *)(parms);
    NSLog(@"%@---input:%@",[NSThread currentThread],input);
    return NULL;
}

/*
 - 在 ARC 开发中, 如果遇到 OC和C 语言中相同数据类型进行转换,需要使用__bridge "桥接"
 - 在 MRC 开发中,不需要桥接
 
 在 OC 中,如果是ARC开发,编译器会在编译的时候,自动根据代码结构,添加 retain , release, autorelease
 ARC 只负责 OC部分的代码,不负责C的代码. 如果C的代码里面出现了 retain/create/copy 字样的函数,都需要release
 
 */

@end
