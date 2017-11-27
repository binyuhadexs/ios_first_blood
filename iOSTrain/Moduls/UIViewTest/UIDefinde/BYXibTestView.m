//
//  BYXibTestView.m
//  iOSTrain
//
//  Created by binyu on 2017/11/22.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYXibTestView.h"
@interface  BYXibTestView()
@property (weak, nonatomic) IBOutlet UIView *image;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end


@implementation BYXibTestView

- (instancetype)initWithFrame:(CGRect)frame{
    NSLog(@"%s",__func__);
    if (self = [super initWithFrame:frame]) {
        [self addViews];
    }
    return self;
}



- (void)awakeFromNib{
    [super awakeFromNib];
    [self addViews];
    NSLog(@"%s",__func__);
}

- (void)addViews{
    UIView *view = [[[NSBundle mainBundle]loadNibNamed:@"BYXibTestView" owner:self options:nil]objectAtIndex:0];
    [self addSubview:view];
    //
}

@end
