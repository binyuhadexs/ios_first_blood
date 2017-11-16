//
//  BYThreadViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/12.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYThreadViewController.h"

@interface BYThreadViewController ()

@end

@implementation BYThreadViewController

- (void)loadTableList{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"thread_mode" ofType:@"plist"];
    self.datas = [[NSArray alloc] initWithContentsOfFile:path];
}

- (void)by_viewDidLoad{
    self.title = @"线程总结";
}


@end
