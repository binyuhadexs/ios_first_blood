//
//  BYAnimationTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/8/27.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYAnimationTestViewController.h"

@interface BYAnimationTestViewController ()
@end

@implementation BYAnimationTestViewController

/*
     https://zsisme.gitbooks.io/ios-/content/chapter1/the-layer-tree.html
 */

/*
 
 UIView和CALayer两个平行层级 ？？ -- 职责分离 iOS 和Mac OS代码共享
 
 视图层级
 图层树
 呈现树
 渲染树
 
 */


- (void)loadTableList{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AnimationTest" ofType:@"plist"];
    self.datas = [[NSArray alloc] initWithContentsOfFile:path];
}

- (void)by_viewDidLoad{
    self.title = @"动画";
}


@end
