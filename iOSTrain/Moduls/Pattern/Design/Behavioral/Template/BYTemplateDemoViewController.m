//
//  BYTemplateDemoViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/12/19.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYTemplateDemoViewController.h"
#import "BYGame.h"
#import "BYCricket.h"
#import "BYFootball.h"


/*
 模板模式
 意图：定义一个操作中的算法的骨架，而将一些步骤延迟到子类中。模板方法使得子类可以不改变一个算法的结构即可重定义该算法的某些特定步骤。
 主要解决：一些方法通用，却在每一个子类都重新写了这一方法。
 何时使用：有一些通用的方法。
 如何解决：将这些通用算法抽象出来。
 关键代码：在抽象类实现，其他步骤在子类实现。
 
 系统案例
 ViewController生命周期方法
 
 */
@interface BYTemplateDemoViewController ()

@end

@implementation BYTemplateDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BYGame *game = [[BYFootball alloc]init];
    [game play];
     BYGame *game2 = [[BYCricket alloc]init];
    [game2 play];
}



@end
