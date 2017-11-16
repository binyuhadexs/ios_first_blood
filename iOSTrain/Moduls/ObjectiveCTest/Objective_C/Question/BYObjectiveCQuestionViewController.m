//
//  BYObjectiveCQuestionViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/10/28.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYObjectiveCQuestionViewController.h"

@interface BYObjectiveCQuestionViewController ()

@end

@implementation BYObjectiveCQuestionViewController

- (void)loadTableList{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ObjectiveC_Question" ofType:@"plist"];
    self.datas = [[NSArray alloc] initWithContentsOfFile:path];
}

- (void)by_viewDidLoad{
    self.title = @"OC面试题";
}



@end
