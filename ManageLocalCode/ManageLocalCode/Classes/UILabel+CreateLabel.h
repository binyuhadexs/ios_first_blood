//
//  UILabel+CreateLabel.h
//  HuiMaiMall
//
//  Created by GX on 14-6-10.
//  Copyright (c) 2014年 HuiMaiMall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CreateLabel)
/**
 *  创建label
 *
 *  @param frame label的尺寸
 *  @param color 文字颜色
 *  @param font  字体
 *  @param align 对齐类型
 *  @param text  文字
 *
 *  @return 返回值
 */
+ (instancetype)createLabelWithFrame:(CGRect)frame TextColor:(UIColor *)color Font:(UIFont *)font textAlignment:(NSTextAlignment)align text:(NSString *)text;

/**
 *  创建label
 *
 *  @param color 创建label的文字颜色
 *  @param font  字体
 *  @param align 对齐方式
 *  @param text  文字
 *
 *  @return 返回值
 */
+ (instancetype)createLabelWithTextColor:(UIColor *)color Font:(UIFont *)font textAlignment:(NSTextAlignment)align text:(NSString *)text;

@end
