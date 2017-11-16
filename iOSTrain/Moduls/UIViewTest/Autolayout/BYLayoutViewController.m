//
//  BYLayoutViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/9.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYLayoutViewController.h"

@interface BYLayoutViewController ()

@end

@implementation BYLayoutViewController

- (void)loadTableList{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"layout" ofType:@"plist"];
    self.datas = [[NSArray alloc] initWithContentsOfFile:path];
}

- (void)by_viewDidLoad{
    self.title = @"自动布局";
}

@end
