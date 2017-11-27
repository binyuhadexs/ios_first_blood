//
//  BYViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/8/21.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYViewController.h"

@interface BYViewController ()

@end

@implementation BYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //导航栏遮挡控件内容 http://www.jianshu.com/p/076703414fb4
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
