//
//  BYAutolayout5ViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/10.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYAutolayout5ViewController.h"

@interface BYAutolayout5ViewController ()

@property (nonatomic,weak) UIView *oneView;

@end

@implementation BYAutolayout5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIView *oneView =   [[UIView alloc] init];
    oneView.backgroundColor = [UIColor grayColor];
    oneView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:oneView];
    
//    NSLayoutConstraint *constraitW =  [NSLayoutConstraint constraintWithItem:oneView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:-100];
//    NSLayoutConstraint *constraitH =  [NSLayoutConstraint constraintWithItem:oneView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1 constant:100];
//
//    NSLayoutConstraint *constraitL =  [NSLayoutConstraint constraintWithItem:oneView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:10];
//
//    NSLayoutConstraint *constraitT =  [NSLayoutConstraint constraintWithItem:oneView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:10];
//
//    [oneView addConstraint:constraitW];
//    [oneView addConstraint:constraitH];
//    [self.view addConstraint:constraitL];
//    [self.view addConstraint:constraitT];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
