//
//  BYMVPDemoViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/12/2.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYMVPDemoViewController.h"
#import "BYMVPView.h"
#import "BYMVPPresenter.h"

@interface BYMVPDemoViewController ()<BYMVPPresenterDelegete,BYMVPViewDelegete>


@property (nonatomic,weak) BYMVPView *vmpView;
@property (nonatomic,strong) BYMVPPresenter *presenter;


@end

//https://baike.baidu.com/item/MVP%E6%A8%A1%E5%BC%8F/10961746?fr=aladdin
//http://www.jianshu.com/p/8d7017ce31aa
/*
 MVP
 View不直接从Model中获取数
 
 View <---> Presenter <---> Model
 View专注于处理数据的可视化以及与用户的交互
 
 
 MVC对比MVP
 
 
 
 */

@implementation BYMVPDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BYMVPView *mvpview = [[BYMVPView alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    self.vmpView = mvpview;
    self.vmpView.delegate = self;
    [self.view addSubview:mvpview];
    
    self.presenter = [[BYMVPPresenter alloc] initWithDelegete:self];
    
    [self.presenter getUserInfo];//获取用户数据
    
    [self.presenter login];
}



#pragma mark -BYMVPPresenterDelegete
-(void)showLoadingView{
    NSLog(@"展示loading动画");
}
-(void)hideLoadingView{
    NSLog(@"隐藏loading动画");
}

-(void)showUserName:(NSString *)name{
    [self.vmpView showUserName:name];
   
}


#pragma mark -BYMVPViewDelegete
//
- (void)changeName{
    // 获取用户输入 并且前端校验
    NSString *name = [NSString stringWithFormat:@"changeName_%d", arc4random_uniform(100)] ;
    [self.presenter changeUserName:name];
}

@end
