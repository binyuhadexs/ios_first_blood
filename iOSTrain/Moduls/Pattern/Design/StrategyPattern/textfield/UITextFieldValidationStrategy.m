//
//  UITextFieldValidationStrategy.m
//  iOSTrain
//
//  Created by binyu on 2017/11/30.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "UITextFieldValidationStrategy.h"
@class UITextField;

@implementation UITextFieldValidationStrategy

- (BOOL)validateTextFieldInput:(UITextField *)textfield{
    self.validateResultStr = @"";
    return NO;
}


@end
