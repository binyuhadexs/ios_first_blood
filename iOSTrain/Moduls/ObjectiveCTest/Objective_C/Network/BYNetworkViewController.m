//
//  BYNetworkViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/16.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYNetworkViewController.h"

@interface BYNetworkViewController ()

@end

@implementation BYNetworkViewController

- (void)loadTableList{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"network" ofType:@"plist"];
    self.datas = [[NSArray alloc] initWithContentsOfFile:path];
}

- (void)by_viewDidLoad{
    self.title = @"网络请求";
}


@end
