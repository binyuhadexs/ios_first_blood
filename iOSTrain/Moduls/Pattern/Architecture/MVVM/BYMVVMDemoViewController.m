//
//  BYMVVMDemoViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/12/3.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYMVVMDemoViewController.h"
#import "BYMVVMView.h"

/*
 http://www.cocoachina.com/ios/20150122/10987.html
 MVVM
 
 View -- ViewModel  -- Model
 
 
 
 */


@interface BYMVVMDemoViewController ()
@property (nonatomic,weak) BYMVVMView *mvvmView;
@property (nonatomic,strong) BYMVVMViewModel *mvvmViewModel;

@end

@implementation BYMVVMDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BYMVVMView *mvpview = [[BYMVVMView alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    self.mvvmView = mvpview;
    
    
//    self.vmpView.delegate = self;
    [self.view addSubview:mvpview];
    self.mvvmViewModel = [[BYMVVMViewModel alloc] init];
    [self.mvvmViewModel login];
    [self.mvvmView showViewModel:self.mvvmViewModel];
}



@end
