//
//  BYMasonryTest2ViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/12.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYMasonryTest2ViewController.h"
#import "Masonry.h"

@interface BYMasonryTest2ViewController ()
@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *blackView;
@property (weak, nonatomic) IBOutlet UIView *greyView;

@end

@implementation BYMasonryTest2ViewController

/*
 
 MASAdditions
 mas_makeConstraints
 mas_remakeConstraints
 mas_updateConstraints
 
 mas_left
 mas_top
 mas_right
 mas_bottom
 mas_leading
 mas_trailing
 mas_width
 mas_height
 mas_centerX
 mas_centerY
 mas_baseline
 mas_attribute
 
 mas_leftMargin
 mas_rightMargin
 mas_topMargin
 mas_bottomMargin
 mas_leadingMargin
 mas_trailingMargin
 mas_centerXWithinMargins
 mas_centerYWithinMargins
 
 
MASConstraint
edges
size
center

 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.yellowView mas_remakeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.equalTo(self.view).offset(50);
        
        //        make.center.equalTo(self.view);
        //        make.size.equalTo(self.view).sizeOffset(CGSizeMake(-50, -50));
        
        //        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(10, 10, 10, 10));
        
//        make.center.equalTo(self.view);
//        make.width.greaterThanOrEqualTo(@200);
//        make.height.equalTo(self.view).multipliedBy(0.5);
        
//        make.edges.equalTo(self.view).leftMargin.mas_equalTo(20);
        
//        make.leading.equalTo(self.view).leadingMargin.mas_equalTo(20);
//        make.trailing.equalTo(self.view).trailingMargin.mas_equalTo(20);
//        make.top.equalTo(self.view).topMargin.mas_equalTo(20);
//        make.bottom.equalTo(self.view).bottomMargin.mas_equalTo(20);
        
//        make.leftMargin.mas_equalTo(120);
        
        
    }];
}




/*
 - (void)updateConstraintsIfNeeded  调用此方法，如果有标记为需要重新布局的约束，则立即进行重新布局，内部会调用updateConstraints方法
 - (void)updateConstraints          重写此方法，内部实现自定义布局过程
 - (BOOL)needsUpdateConstraints     当前是否需要重新布局，内部会判断当前有没有被标记的约束
 - (void)setNeedsUpdateConstraints  标记需要进行重新布局
 
 
 - (void)setNeedsLayout  标记为需要重新布局
 - (void)layoutIfNeeded  查看当前视图是否被标记需要重新布局，有则在内部调用layoutSubviews方法进行重新布局
 - (void)layoutSubviews  重写当前方法，在内部完成重新布局操作
 */
@end
