//
//  MainViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/8/21.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "MainViewController.h"
#import "BYObjectCViewController.h"
#import "BYUIViewTestViewController.h"
#import "BYUINavigationController.h"
#import "BYUITabBarController.h"
#import "BYPaternPracticeViewController.h"
#import "BYFrameworkViewController.h"

@interface MainViewController ()


@property (nonatomic,strong) BYUITabBarController *tabBarController;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addTabBar];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)addTabBar{
    
    //第一个
    BYObjectCViewController *firstController = [[BYObjectCViewController alloc] init];
    BYUINavigationController *firstNavigationController = [[BYUINavigationController alloc] initWithRootViewController:firstController];
    UITabBarItem *tabbarItemFirst = [[UITabBarItem alloc] initWithTitle:@"OC知识点" image:[UIImage imageNamed:@"tabbar_router_focus"] tag:0];
    firstNavigationController.tabBarItem = tabbarItemFirst;
    
    //第二个
    BYUIViewTestViewController *secondController = [[BYUIViewTestViewController alloc] init];
    BYUINavigationController *secondNavigationController = [[BYUINavigationController alloc] initWithRootViewController:secondController];
    UITabBarItem *tabbarItemSecond =  [[UITabBarItem alloc] initWithTitle:@"UI控件" image:[UIImage imageNamed:@"tabbar_router_focus"] tag:1];
    secondNavigationController.tabBarItem = tabbarItemSecond;

    
    //第三个
    BYPaternPracticeViewController *threeController = [[BYPaternPracticeViewController alloc] init];
    BYUINavigationController *threeNavigationController = [[BYUINavigationController alloc] initWithRootViewController:threeController];
    UITabBarItem *tabbarItemThree =  [[UITabBarItem alloc] initWithTitle:@"设计模式" image:[UIImage imageNamed:@"tabbar_router_focus"] tag:2];
    threeNavigationController.tabBarItem = tabbarItemThree;
    
    //第4个
    BYFrameworkViewController *fourController = [[BYFrameworkViewController alloc] init];
    BYUINavigationController *fourNavigationController = [[BYUINavigationController alloc] initWithRootViewController:fourController];
    UITabBarItem *tabbarItemFour =  [[UITabBarItem alloc] initWithTitle:@"框架" image:[UIImage imageNamed:@"tabbar_router_focus"] tag:3];
    fourNavigationController.tabBarItem = tabbarItemFour;
    
    NSArray *controllersArray = @[secondNavigationController,firstNavigationController,threeNavigationController,fourNavigationController];
    [self.tabBarController setViewControllers:controllersArray];
    [self addChildViewController:self.tabBarController];
    [self.view addSubview:self.tabBarController.view];
    [self.tabBarController didMoveToParentViewController:self]; //???????
    
    
    
}



- (BYUITabBarController *)tabBarController{
    if (!_tabBarController) {
        _tabBarController = [[BYUITabBarController alloc] init];
    }
    return _tabBarController;
}


/*
 LOG技巧
 对象
 -(NSString *)description
 数据类型
 -(NSString *)descriptionWithLocale:(id)locale;
 - (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level;
 */



@end
