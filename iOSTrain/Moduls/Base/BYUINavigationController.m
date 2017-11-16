//
//  BYUINavigationController.m
//  iOSTrain
//
//  Created by binyu on 2017/8/21.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYUINavigationController.h"

@interface BYUINavigationController ()

@end

@implementation BYUINavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 滑动返回
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}




- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    //隐藏tabbar
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
    
}


@end
