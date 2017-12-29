//
//  BYMVVMView.m
//  iOSTrain
//
//  Created by binyu on 2017/12/3.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYMVVMView.h"
#import "NSObject+FBKVOController.h"


@interface BYMVVMView()

@property(nonatomic,weak) UIButton *changeName;
@property(nonatomic,weak) UILabel *label;

@end

@implementation BYMVVMView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (void)setupUI{
    self.backgroundColor = [UIColor grayColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    self.changeName = button;
    [self.changeName setTitle:@"改名" forState:UIControlStateNormal];
    [self.changeName addTarget:self action:@selector(changeNameClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.changeName];
    
    UILabel *label =  [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 150, 150)];
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:14];
    self.label = label;
    [self addSubview:label];
}

- (void)changeNameClick{
    //模拟用户交互
    [self.viewModel changeNmae];
}


- (void)showViewModel:(BYMVVMViewModel *)vm{
    self.viewModel = vm;
    [self.KVOController observe:self.viewModel keyPath:@"nameStr" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
//        NSLog(@"change=%@",change);
        _label.text = change[NSKeyValueChangeNewKey];
    }];
    
    [self.KVOController observe:self.viewModel keyPath:@"showLoading" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
//        NSLog(@"change=%@",change);
        NSString *showing = change[NSKeyValueChangeNewKey];
//        NSString  *showing = change[@"new"];
        if ([@"showing" isEqualToString:showing]) {
            NSLog(@"showLoading");
        } else {
            NSLog(@"hideLoading");
        }
    }];
    
    
}


@end
