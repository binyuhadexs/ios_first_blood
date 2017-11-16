//
//  BYObjectCViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/8/21.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYObjectCViewController.h"

@interface BYObjectCViewController ()

@end

@implementation BYObjectCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSString *a = @(1);
//    NSString *ABC = nil;
//    if([@"" isEqualToString:ABC]){
//        NSLog(@"0000--");
//    }
//    if([a isEqualToString:ABC]){
//        NSLog(@"0000--");
//    }
//
//    if(2){
//        NSLog(@"2--");
//    }
}


- (void)loadTableList{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ObjectiveC" ofType:@"plist"];
    self.datas = [[NSArray alloc] initWithContentsOfFile:path];
}

- (void)by_viewDidLoad{
    self.title = @"OC知识点";
}

//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//}

@end
