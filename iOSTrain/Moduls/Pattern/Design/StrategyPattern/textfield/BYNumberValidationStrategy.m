//
//  BYNumberValidationStrategy.m
//  iOSTrain
//
//  Created by binyu on 2017/11/30.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYNumberValidationStrategy.h"


@implementation BYNumberValidationStrategy

//校验是否是数字
- (BOOL)validateTextFieldInput:(UITextField *)textfield{
    NSString *checkStr = textfield.text;
    NSScanner* scan = [NSScanner scannerWithString:checkStr];
    int val;
    BOOL result =  [scan scanInt:&val] && [scan isAtEnd];
    if (!result) {
        self.validateResultStr = @"不是纯数字";
    }
    return result;
}


@end
