//
//  ColorView.m
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "ColorView.h"


@interface ColorView ()
@property (nonatomic, strong) UIView   *smallView;
@property (nonatomic, strong) UILabel  *userLabel;
@property (nonatomic, strong) UILabel  *pswLabel;
@end

@implementation ColorView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

// 添加UI
- (void)setupUI {
    // 灰色的view
    self.backgroundColor = [UIColor lightGrayColor];
    CGFloat width = self.bounds.size.width;
    self.smallView = [[UIView alloc] initWithFrame:CGRectMake(0, 60, width,200)];
    [self addSubview:self.smallView];
    
    // 用户名
    self.userLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 100, 150, 25)];
    [self addSubview:self.userLabel];
    
    // 密码
    self.pswLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 130, 150, 25)];
    [self addSubview:self.pswLabel];
}

// 给属性赋值
- (void)loadModel:(id <TargeyProtocol>)model {
    self.pswLabel.text = model.password;
    self.userLabel.text = model.userName;
    self.smallView.backgroundColor = model.smallViewColor;
}




@end
