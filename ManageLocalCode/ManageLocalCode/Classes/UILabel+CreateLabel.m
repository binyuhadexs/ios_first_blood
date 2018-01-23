//
//  UILabel+CreateLabel.m
//  HuiMaiMall
//
//  Created by GX on 14-6-10.
//  Copyright (c) 2014年 HuiMaiMall. All rights reserved.
//

#import "UILabel+CreateLabel.h"

@implementation UILabel (CreateLabel)
+ (instancetype)createLabelWithFrame:(CGRect)frame TextColor:(UIColor *)color Font:(UIFont *)font textAlignment:(NSTextAlignment)align text:(NSString *)text
{
    UILabel * label = [[UILabel alloc] initWithFrame:frame] ;
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:font];
    label.textColor= color;
    label.textAlignment = align ;
    label.text= text;
    return label;
}

+ (instancetype)createLabelWithTextColor:(UIColor *)color Font:(UIFont *)font textAlignment:(NSTextAlignment)align text:(NSString *)text
{
    UILabel * label = [[UILabel alloc] init] ;
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:font];
    label.textColor= color;
    label.textAlignment = align ;
    label.text= text;
    return label;
}
@end
