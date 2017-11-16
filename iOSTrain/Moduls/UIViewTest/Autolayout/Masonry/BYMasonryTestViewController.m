//
//  BYMasonryTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/10.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYMasonryTestViewController.h"
#import "Masonry.h"

#define kMainScreenWidth [UIScreen mainScreen].bounds.size.width


@interface BYMasonryTestViewController ()

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIView *firestView;
@property (nonatomic,strong) UIView *secondView;
@property (nonatomic,strong) UIView *threeView;

@end

@implementation BYMasonryTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(20).mas_equalTo(20);
//        make.left.equalTo(self.view);
//    }];
    
//    [self initViews2];
    [self initViews];
    
   
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"frame=%@",NSStringFromCGRect(self.scrollView.frame));
    NSLog(@"bounds=%@",NSStringFromCGRect(self.scrollView.bounds));
}

- (void)initViews2{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, self.view.frame.size.height)];
    self.firestView = [[UIView alloc] initWithFrame:self.view.frame];
    self.firestView.backgroundColor = [UIColor blueColor];
    self.secondView = [[UIView alloc] initWithFrame:CGRectMake(kMainScreenWidth, 0, kMainScreenWidth, self.view.frame.size.height)];
    self.secondView.backgroundColor = [UIColor redColor];
    self.threeView = [[UIView alloc] initWithFrame:CGRectMake(kMainScreenWidth*2, 0, kMainScreenWidth, self.view.frame.size.height)];
    self.threeView.backgroundColor = [UIColor grayColor];
    
    [self.scrollView setContentSize:CGSizeMake(kMainScreenWidth *3, 0)];
    [self.scrollView addSubview:self.firestView];
     [self.scrollView addSubview:self.secondView];
    [self.scrollView addSubview:self.threeView];
    [self.view addSubview:self.scrollView];
}

- (void)initViews{
    self.scrollView = [[UIScrollView alloc] init];
    self.firestView = [[UIView alloc] init];
    self.firestView.backgroundColor = [UIColor blueColor];
    self.secondView = [[UIView alloc] init];
    self.secondView.backgroundColor = [UIColor redColor];
    self.threeView = [[UIView alloc] init];
    self.threeView.backgroundColor = [UIColor grayColor];
    
    [self.scrollView setContentSize:CGSizeMake(kMainScreenWidth *3, 0)];
//    [self.scrollView addSubview:self.firestView];
//    [self.scrollView addSubview:self.secondView];
//    [self.scrollView addSubview:self.threeView];
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.top.trailing.bottom.equalTo(self.view);
        make.edges.equalTo(self.view);
    }];

    [self.scrollView addSubview:self.firestView];
    [self.firestView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.top.width.height.equalTo(self.scrollView);
//        make.trailing.equalTo(self.secondView);
        make.size.leading.top.equalTo(self.scrollView);
    }];

   
    [self.scrollView addSubview:self.secondView];
    [self.secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.top.equalTo(self.scrollView);
//        make.leading.equalTo(self.scrollView).mas_offset(kMainScreenWidth);
        make.leading.equalTo(self.firestView.mas_trailing);
    }];

    [self.scrollView addSubview:self.threeView];
    [self.threeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.top.equalTo(self.scrollView);
//        make.leading.equalTo(self.scrollView).mas_offset(kMainScreenWidth*2);
        make.leading.equalTo(self.secondView.mas_trailing);
    }];
    
    
}

//- (void)updateViewConstraints{
//
//}

@end
