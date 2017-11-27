//
//  VCView.m
//  05-手势解锁
//
//  Created by Gavin on 15/9/14.
//  Copyright (c) 2015年 Gavin. All rights reserved.
//

#import "VCView.h"

@implementation VCView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //加载图片
    UIImage *image = [UIImage imageNamed:@"Home_refresh_bg"];
    [image drawInRect:rect];
    
    
}


@end
