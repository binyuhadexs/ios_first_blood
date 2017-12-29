//
//  BYMVCView.m
//  iOSTrain
//
//  Created by binyu on 2017/12/2.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYMVCView.h"

@interface BYMVCView()

@property(nonatomic,weak) UIButton *changeName;
@property(nonatomic,strong) BYMVCModel *model;

@end

@implementation BYMVCView



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
}

- (void)showUserInfo:(BYMVCModel *)model{
    //模拟数据展示
    self.model = model;
    NSLog(@"model=%@",model);
}

- (void)changeNameClick{
    //模拟用户交互
    
    if (_delegate && [_delegate respondsToSelector:@selector(changeName)]) {
        [self.delegate changeName];
    }
}


@end
