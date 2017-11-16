//
//  BYFoundationTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/10/28.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYFoundationTestViewController.h"

@interface BYFoundationTestViewController ()

@end

@implementation BYFoundationTestViewController

- (void)loadTableList{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ObjectiveC_Foundation" ofType:@"plist"];
    self.datas = [[NSArray alloc] initWithContentsOfFile:path];
}

- (void)by_viewDidLoad{
    self.title = @"Foundation框架";
}


@end
