//
//  BYCopyTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/21.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYCopyTestViewController.h"
#import "BYPersionCopy.h"
#import "Boy.h"

@interface BYCopyTestViewController ()

@property (nonatomic,strong)BYPersionCopy *persion;

@end
/*
   深拷贝 浅拷贝
 https://www.zybuluo.com/MicroCai/note/50592
 浅复制(shallow copy)：在浅复制操作时，对于被复制对象的每一层都是指针复制。
 深复制(one-level-deep copy)：在深复制操作时，对于被复制对象，至少有一层是深复制。
 完全复制(real-deep copy)：在完全复制操作时，对于被复制对象的每一层都是对象复制。
 
 
 非集合类对象的copy与mutableCopy
 在非集合类对象中：对immutable对象进行copy操作，是指针复制，mutableCopy操作时内容复制；对mutable对象进行copy和mutableCopy都是内容复制。用代码简单表示如下：
 [immutableObject copy] // 浅复制
 [immutableObject mutableCopy] //深复制
 [mutableObject copy] //深复制
 [mutableObject mutableCopy] //深复制
 
 集合类对象的copy与mutableCopy
 在集合类对象中，对immutable对象进行copy，是指针复制，mutableCopy是内容复制；对mutable对象进行copy和mutableCopy都是内容复制。但是：集合对象的内容复制仅限于对象本身，对象元素仍然是指针复制。用代码简单表示如下：
 
 [immutableObject copy] // 浅复制
 [immutableObject mutableCopy] //单层深复制
 [mutableObject copy] //单层深复制
 [mutableObject mutableCopy] //单层深复制
 
 */

/*
 copy的作用
 1、防止外界修改内部的数据 （源为Mutable）
 
 block 使用 copy 还是strong
 
 */

@implementation BYCopyTestViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    BYPersionCopy *persion = [[BYPersionCopy alloc] init];
    
    persion.name = [NSString stringWithFormat:@"%@",@"张三"];
    NSMutableString *tmpAvar = [NSMutableString stringWithFormat:@"htt"];
    persion.name = tmpAvar;
    persion.avar = tmpAvar;
   NSLog(@"persion=%@",persion);
//    BYPersionCopy *persion2 = [[BYPersionCopy alloc] init];
//    persion2.name = @"李四";
//    persion2.avar = @"http://www.baidu.com2";
//    persion.schoolmates =@[persion2];
   
//    NSLog(@"persion=%p",&persion2);
    [tmpAvar appendString:@"p://www.baidu.com2"];
    
    self.persion = persion;
//     persion.name =  persion2.name; //copy
//     persion.avar =  persion2.avar;
    
//    persion2.name = @"王五";
//    persion2.avar = @"http:";
    NSLog(@"self.persion=%@",self.persion);
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

//    [self demoe];
    
    [self demoArray];
//    [self demoArray2];
//    [self demoArray3];
}

- (void)demoArray{
    NSArray *ARR = @[@"12",@"1111"];
    NSLog(@"ARR=%p",ARR);
    NSArray *ARRc = [ARR copy];// [ARR mutableCopy];
//    NSArray *ARRc = [[NSArray alloc] initWithArray:ARR copyItems:YES];;
    NSLog(@"ARRc=%p",ARRc);
    for (int i = 0; i < ARRc.count; i++) {
         NSLog(@"ARR=%p",ARR[i]);
    }
    for (int i = 0; i < ARRc.count; i++) {
        NSLog(@"ARRc=%p",ARRc[i]);
    }

//    ARR[0] = @"1234";
//
//    NSLog(@"ARR=%@",ARR);
//    NSLog(@"ARRc=%@",ARRc);
}

- (void)demoArray2{
    BYPersionCopy *boy = [[BYPersionCopy alloc] init];
    boy.name = [NSString stringWithFormat:@"%@",@"张三1"];;
    BYPersionCopy *boy2 = [[BYPersionCopy alloc] init];
    boy2.name = [NSString stringWithFormat:@"%@",@"张三2"];;
    NSArray *ARR = [NSArray arrayWithObjects:boy,boy2, nil];;
    NSLog(@"ARR=%p",ARR);
    NSArray *ARRc = [ARR copy];// [ARR mutableCopy];
    NSLog(@"ARRc=%p",ARRc);
    for (int i = 0; i < ARR.count; i++) {
        NSLog(@"ARR=%@",ARR[i]);
    }
    for (int i = 0; i < ARRc.count; i++) {
        NSLog(@"ARRc=%@",ARRc[i]);
    }
    
//    BYPersionCopy     ARR[0] = @"1234";
    //
    //    NSLog(@"ARR=%@",ARR);
    //    NSLog(@"ARRc=%@",ARRc);
}

- (void)demoArray3{
    BYPersionCopy *boy = [[BYPersionCopy alloc] init];
    boy.name = [NSString stringWithFormat:@"%@",@"张三1"];;
    BYPersionCopy *boy2 = [[BYPersionCopy alloc] init];
    boy2.name = [NSString stringWithFormat:@"%@",@"张三2"];;
    NSMutableArray *ARR = [NSMutableArray arrayWithObjects:boy,boy2, nil];;
    NSLog(@"ARR=%p",ARR);
//    NSMutableArray *ARRc = [ARR mutableCopy];//浅拷贝
    NSArray *ARRc = [[NSArray alloc]initWithArray:ARR copyItems:YES];//深拷贝
    NSLog(@"ARRc=%p",ARRc);
    
    for (int i = 0; i < ARR.count; i++) {
        NSLog(@"ARR=%p,%@",ARR[i],ARR[i]);
    }
    for (int i = 0; i < ARRc.count; i++) {
        NSLog(@"ARRc=%p,%@",ARRc[i],ARRc[i]);
    }

}

-(void)demoe{
//     BYPersionCopy *persion4 =  self.persion;
//     persion4.name = @"123";
    
    BYPersionCopy *persion3 = [self.persion copy];
  
    //     persion3.avar = @"www.baidu.";
    NSLog(@"persion3=%@",persion3);
//    NSLog(@"persion3=%p",persion3);
//    NSLog(@"self.persion=%p",_persion);
    persion3.avar = @"王五";
     NSLog(@"self.persion=%@",self.persion);
    //    NSLog(@"persion3=%@",persion3.schoolmates[0]);
    //    NSLog(@"self.persion=%@", self.persion);
}


-(void)demoe1{
    BYPersionCopy *persion3 = [self.persion copy];
    //    persion3.name = @"王五";
    //     persion3.avar = @"www.baidu.";
    NSLog(@"persion3=%@",persion3);
    //      NSLog(@"persion=%p",&persion3);
    
    //    NSLog(@"persion3=%@",persion3.schoolmates[0]);
    //    NSLog(@"self.persion=%@", self.persion);
}

-(void)demoe2{
    BYPersionCopy *persion4 = [self.persion mutableCopy];
    NSLog(@"persion4=%@",persion4);
    persion4.name = @"王五";
    NSLog(@"persion4=%@",persion4);
    NSLog(@"self.persion=%@", self.persion);
}


@end
