//
//  BYBlockTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/20.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYBlockTestViewController.h"
typedef NSInteger(^SUMA)(NSInteger,NSInteger);

@interface BYBlockTestViewController ()


@property(copy,nonatomic) NSInteger(^sum)(NSInteger a,NSInteger b);
@property(copy,nonatomic) NSInteger(^result)(NSInteger aa,NSInteger bb,NSInteger cc);

@property(assign,nonatomic) NSInteger test;
@end

/*
 Block 闭包
 
 
 */

@implementation BYBlockTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.sum = ^NSInteger(NSInteger a, NSInteger b) {
        return a+b;
    };
   __block  NSInteger sum =  self.sum(1,2);
    NSLog(@"test=%ld",sum);
    
    SUMA abc = ^NSInteger(NSInteger a, NSInteger b) {
        self.test = 12;
        sum = 1000;
         NSLog(@"blocksum=%ld",sum);
        return a*b;
    };
    NSLog(@"_test=%ld",_test);
    NSLog(@"sum=%ld",sum);
    
    NSInteger suma = abc(12,10);
     NSLog(@"suma=%ld",suma);
    
   self.result =  [self getSum:^NSInteger(NSInteger a, NSInteger b) {
        return a+b;
    }];
   NSInteger test =  self.result(3,4,5);
   NSLog(@"test=%ld",test);
    
    NSInteger(^ABC)(NSInteger aa,NSInteger bb,NSInteger cc) =[self getSum:^NSInteger(NSInteger a, NSInteger b) {
        return a*b;
    }];
    NSInteger test2 = ABC(2,3,4);
    NSLog(@"test=%ld",test2);
    NSInteger(^ABCD)(NSInteger aa) =   [self complex:^NSInteger(NSInteger aa, NSInteger bb, NSInteger cc) {
        return aa+bb+cc*ABC(5,4,3);
    }];
     NSInteger test3 = ABCD(5);// 5*(4+5+6*(3+4+5+(6*2))) 75*5
     NSLog(@"test=%ld",test3);
}

//block作为参数和返回值
- (NSInteger(^)(NSInteger aa,NSInteger bb,NSInteger cc))getSum:(NSInteger(^)(NSInteger a,NSInteger b)) test{
//     NSLog(@"test=%ld",);
    return ^NSInteger(NSInteger a,NSInteger b,NSInteger c){
        return a+b+c+test(6,2);
    };
}


-(NSInteger(^)(NSInteger ye))complex:(NSInteger(^)(NSInteger aa,NSInteger bb,NSInteger cc)) binyu{
    return  ^NSInteger(NSInteger ye){
        return ye*binyu(4,5,6);
    };
}

@end
