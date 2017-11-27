//
//  UIViewTrainingViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/10/4.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYUIViewTrainingViewController.h"

@interface BYUIViewTrainingViewController ()

@end

/*
 SB和XIB的前世今生
 https://www.cnblogs.com/zouhengwei/p/5466994.html
 */
/*
 触摸事件
 http://www.imlifengfeng.com/blog/?p=598
 */

@implementation BYUIViewTrainingViewController

- (void)loadTableList{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"UIViewTraining" ofType:@"plist"];
    self.datas = [[NSArray alloc] initWithContentsOfFile:path];
}

- (void)by_viewDidLoad{
    self.title = @"控件基本使用";
}

@end
