//
//  BYAutolayout4ViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/10.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYAutolayout4ViewController.h"

@interface BYAutolayout4ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation BYAutolayout4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSLayoutConstraint
    //
    _scrollView.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
