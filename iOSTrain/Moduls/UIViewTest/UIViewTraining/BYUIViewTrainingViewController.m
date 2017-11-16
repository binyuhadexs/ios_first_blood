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

@implementation BYUIViewTrainingViewController

- (void)loadTableList{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"UIViewTraining" ofType:@"plist"];
    self.datas = [[NSArray alloc] initWithContentsOfFile:path];
}

- (void)by_viewDidLoad{
    self.title = @"动画";
}

@end
