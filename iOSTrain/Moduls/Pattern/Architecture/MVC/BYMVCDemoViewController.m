//
//  BYMVCDemoViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/12/2.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYMVCDemoViewController.h"
#import "BYMVCModel.h"
#import "BYMVCView.h"


//http://www.runoob.com/design-pattern/mvc-pattern.html
/*
 MVC
 
 Model-View-Controller（模型-视图-控制器）
模型：模型持有所有的数据、状态和程序逻辑。模型独立于视图和控制器。通常模型对象负责在数据库中存取数据。
视图：处理数据显示的部分。视图通常直接从模型中取得它需要显示的状态与数据。对于相同的信息可以有多个不同的显示形式或视图。
控制器：处理用户交互的部分，通常控制器负责从视图读取数据，控制用户输入，并向模型发送数据。
 
               改变显示
               <----
       View     ---->    Controller
  获取数据 <-      用户交互   /
           \\             /
            \\           /改变状态
     通知视图  -> Model <-
                 |
                 |
                数据库
 
 */

/*
 优点：可维护性、可测试性和组件的可复用性
 
 缺点：
 1、增加系统结构和实现的复杂性
 2、视图与控制器间的过于紧密的连接
 3、视图对模型数据的低效率访问  -- 有些数据并每一改变也需要更新View
 */

/*
 iOS MVC愿景
 View  <---> Controller  <---> Model
 
 
 */

@interface BYMVCDemoViewController ()<BYMVCViewDelegete>

@property(nonatomic,weak) BYMVCView *mvcView;
@property(nonatomic,strong) BYMVCModel *model;

@end

@implementation BYMVCDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BYMVCView *view =  [[BYMVCView alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    
    self.mvcView = view;
    self.model = [BYMVCModel getUser];// 获取数据
    [self.view addSubview:view];
    [self.mvcView showUserInfo:self.model]; //展示
    self.mvcView.delegate = self;
}

#pragma mark - BYMVCViewDelegete

- (void)changeName{
    NSString *name = @"获取数据，做逻辑处理";
    [self.model changeName:name result:^(NSString *result) {
        [self.mvcView showUserInfo:self.model]; //展示
        NSLog(@"%@",result);
    }];
    
    //
   //    [self.model changeName:@"abc"];
    
    
    

}


@end
