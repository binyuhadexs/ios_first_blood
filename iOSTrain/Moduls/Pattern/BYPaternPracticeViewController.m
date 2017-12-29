//
//  BYPatrernPracticeViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/16.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYPaternPracticeViewController.h"


@interface BYPaternPracticeViewController ()

@end

/*
 架构：
 
 MVC
 MVP
 MVVM
 VIPER
 
 http://www.cocoachina.com/ios/20160108/14916.html
 
 */

@implementation BYPaternPracticeViewController


- (NSString *)by_fileNamePlistSource{
    return @"DesignPaterns";
}

- (void)by_viewDidLoad{
    self.title = @"架构";
}


@end
