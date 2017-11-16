//
//  BYAutolayout6ViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/10.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYAutolayout6ViewController.h"

@interface BYAutolayout6ViewController ()

@end

@implementation BYAutolayout6ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *oneView =   [[UIView alloc] init];
    oneView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:oneView];
    oneView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *constraitW =  [NSLayoutConstraint constraintWithItem:oneView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:200];
    
    NSLayoutConstraint *constraitH =  [NSLayoutConstraint constraintWithItem:oneView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:200];
    
    NSLayoutConstraint *constraitL =  [NSLayoutConstraint constraintWithItem:oneView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:80];
    
    NSLayoutConstraint *constraitT =  [NSLayoutConstraint constraintWithItem:oneView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:80];
    
//    [oneView addConstraint:constraitW];
//    [oneView addConstraint:constraitH];
    
    [self.view addConstraint:constraitW];
    [self.view addConstraint:constraitH];
//    [self.view addSubview:oneView];
    
    //？？？？
    [self.view addConstraint:constraitL];
    [self.view addConstraint:constraitT];
//     [self.view addSubview:oneView];  异常
    
    //frame bounds center
//    self.view.layer.anchorPoint //
//    self.view.bounds.size.width;

    
}

- (void)test{
    
}

@end
