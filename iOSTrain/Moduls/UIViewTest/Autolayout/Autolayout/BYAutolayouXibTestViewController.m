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

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.topAnchor
    
    // Do any additional setup after loading the view from its nib.
}

@end
