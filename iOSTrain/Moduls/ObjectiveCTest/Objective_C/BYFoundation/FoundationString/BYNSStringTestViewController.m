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
@property (nonatomic,copy) NSString *NSStringStr;
@property (nonatomic,copy) NSMutableString *NSMutableStringStr;
@property (nonatomic,strong) NSMutableString *NSMutableStringStr2;

@end

@implementation BYNSStringTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.wrapper = [[BYWebPramaWrapper alloc] init];
    
    [self test];
    
    NSMutableString *string = [NSMutableString stringWithFormat:@"%@",@"abcd"];
    //  [[[NSMutableString alloc] init] appendString:@"1234567"];
    
    self.NSStringStr = [string copy];
    self.NSMutableStringStr = string;
    self.NSMutableStringStr2 = string;//[string mutableCopy];
    NSLog(@"string=%@=%p",string);
    
    NSLog(@"NSStringStr=%@=%p",self.NSStringStr,self.NSStringStr);
    NSLog(@"NSMutableStringStr=%@=%p",self.NSMutableStringStr,self.NSMutableStringStr);
    NSLog(@"NSMutableStringStr2=%@=%p",self.NSMutableStringStr2,self.NSMutableStringStr2);
    [string appendString:@"abcd"];
     NSLog(@"string=%@=%p",string,string);
    NSLog(@"NSStringStr=%@=%p",self.NSStringStr,self.NSStringStr);
    NSLog(@"NSMutableStringStr=%@=%p",self.NSMutableStringStr,self.NSMutableStringStr);
    NSLog(@"NSMutableStringStr2=%@=%p",self.NSMutableStringStr2,self.NSMutableStringStr2);
    
     [self.NSMutableStringStr2 appendString:@"abcd"];
     NSLog(@"NSMutableStringStr2=%@=%p",self.NSMutableStringStr2,self.NSMutableStringStr2);
    
//     [self.NSMutableStringStr2 appendString:@"8910"];
//         [self.NSMutableStringStr2 appendString:@"8910"];
    //     NSLog(@"NSMutableStringStr2=%@",self.NSMutableStringStr2);
    
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


//常用方法


//




@end
