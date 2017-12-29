//
//  UITextFieldValidationStrategy.h
//  iOSTrain
//
//  Created by binyu on 2017/11/30.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 UITextField 校验策略的抽象类
 
 */
@interface UITextFieldValidationStrategy : NSObject

//校验结果描述
@property(nonatomic,copy) NSString *validateResultStr;

//长度校验
@property(nonatomic,assign) NSInteger inputLength;

/**
 校验方法

 @param textfield 输入控件
 @return BOOL YES 通过校验 NO 输入内容校验不通过
 */
- (BOOL)validateTextFieldInput:(UITextField *)textfield;

@end
