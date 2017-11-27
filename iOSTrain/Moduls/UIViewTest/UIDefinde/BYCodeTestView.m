//
//  BYCodeTestView.m
//  iOSTrain
//
//  Created by binyu on 2017/11/22.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYCodeTestView.h"


@implementation BYCodeTestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
      NSLog(@"%s",__func__);
    if (self = [super initWithFrame:frame]) {
        [self addViews];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
     NSLog(@"%s",__func__);
    if (self == [super initWithCoder:aDecoder]) {
        
    }
    return self;
}


- (void)awakeFromNib{
    [super awakeFromNib];
    [self addViews];
      NSLog(@"%s",__func__);
}

- (void)addViews{
    self.backgroundColor = [UIColor grayColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageView.image = [UIImage imageNamed:@"oc_knowledge_tree"];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:imageView];
     NSLog(@"%s",__func__);
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = [UIColor greenColor];
    button.titleLabel.font = [UIFont systemFontOfSize:10];
    [button setTitle:@"BUTTON" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [self addSubview:button];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraitW =  [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50];
    
    NSLayoutConstraint *constraitH =  [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40];
    
    NSLayoutConstraint *constraitL =  [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
    
    NSLayoutConstraint *constraitT =  [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeBottom multiplier:1 constant:20];
    [self addConstraint:constraitW];
    [self addConstraint:constraitH];
    [self addConstraint:constraitL];
    [self addConstraint:constraitT];
}



- (void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"%s",__func__);
}

- (void)didAddSubview:(UIView *)subview{
    [super didAddSubview:subview];
   NSLog(@"%s",__func__);
}

- (void)willRemoveSubview:(UIView *)subview{
    [super willRemoveSubview:subview];
   NSLog(@"%s",__func__);
}

- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
   NSLog(@"%s",__func__);
}

- (void)didMoveToSuperview{
    [super didMoveToSuperview];
  NSLog(@"%s",__func__);
}

- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToWindow:newWindow];
   NSLog(@"%s",__func__);
}

- (void)didMoveToWindow{
    [super didMoveToWindow];
   NSLog(@"%s",__func__);
}

- (void)removeFromSuperview{
    [super removeFromSuperview];
    NSLog(@"%s",__func__);
}

- (void)dealloc{
   NSLog(@"%s",__func__);
}

@end
