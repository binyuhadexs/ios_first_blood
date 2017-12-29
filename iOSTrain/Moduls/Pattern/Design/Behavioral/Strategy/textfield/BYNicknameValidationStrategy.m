//
//  BYNicknameValidationStrategy.m
//  iOSTrain
//
//  Created by binyu on 2017/11/30.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYNicknameValidationStrategy.h"

@implementation BYNicknameValidationStrategy

//校验昵称

- (BOOL)validateTextFieldInput:(UITextField *)textfield{
    NSString *regex = @"^[a-z0－9A-Z]*$";
    // 创建谓词对象并设定条件的表达式
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    // 对字符串进行判断
    if ([predicate evaluateWithObject:textfield.text]) {
        return YES;
    }
    self.validateResultStr = @"昵称不合法";
    return NO;
}

@end

