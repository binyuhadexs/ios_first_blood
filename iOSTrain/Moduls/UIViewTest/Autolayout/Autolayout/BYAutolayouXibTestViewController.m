//
//  BYAutolayouXibTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/9.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYAutolayouXibTestViewController.h"

@interface BYAutolayouXibTestViewController ()

@end

@implementation BYAutolayouXibTestViewController

/*
 发挥出相应设备的特色
 
 size class
 http://www.jianshu.com/p/f20a0e92ea76
 手机竖屏wChR 横频5.5吋以下 wChC，以上 wRhC
 Pid横竖屏 wRhR
 
 use trait variations
 xcode8之后  size class被Trait Variations
 http://blog.csdn.net/gf771115/article/details/77507098
 
 xcode9之后
 Safe Area Layout Guide 取代iOS7 Top Layout Guide和Bottom Layout Guide
 https://www.cnblogs.com/6duxz/p/7591103.html
 */

/*
 iOS9
 stackview
 
 */

/*
 在添加时要注意目标view需要遵循以下规则：
 （1）对于两个同层级view之间的约束关系，添加到它们的父view上
 （2）对于两个不同层级view之间的约束关系，添加到他们最近的共同父view上
 （3）对于有层次关系的两个view之间的约束关系，添加到层次较高的父view上
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.topAnchor
    
    // Do any additional setup after loading the view from its nib.
}

@end
