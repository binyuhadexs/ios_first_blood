//
//  BYMVPView.m
//  iOSTrain
//
//  Created by binyu on 2017/12/3.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYMVPView.h"

@interface BYMVPView()

@property(nonatomic,weak) UIButton *changeName;
@property(nonatomic,weak) UILabel *label;

@end

@implementation BYMVPView

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
    if (_delegate && [_delegate respondsToSelector:@selector(changeName)]) {
        [self.delegate changeName];
    }
}


- (void)showUserName:(NSString *)name{
    self.label.text = name;
}

@end
