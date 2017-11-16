//
//  BYDataCacheViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/16.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYDataCacheViewController.h"

@interface BYDataCacheViewController ()

@end

@implementation BYDataCacheViewController

- (void)loadTableList{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data_cache" ofType:@"plist"];
    self.datas = [[NSArray alloc] initWithContentsOfFile:path];
}

- (void)by_viewDidLoad{
    self.title = @"数据持久化";
}


@end
