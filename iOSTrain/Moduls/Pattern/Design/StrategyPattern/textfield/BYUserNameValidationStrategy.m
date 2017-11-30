//
//  BYUserNameValidationStrategy.m
//  iOSTrain
//
//  Created by binyu on 2017/11/30.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYUserNameValidationStrategy.h"

@implementation BYUserNameValidationStrategy

/*
 //谓词 使用
 http://www.cocoachina.com/ios/20160111/14926.html
 
 */

//校验用户名
- (BOOL)validateTextFieldInput:(UITextField *)textfield{
    NSString *regex = @"[a-zA-Z.\u4e00-\u9fa5]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if([pred evaluateWithObject: textfield.text]){
        return YES;
    }
    self.validateResultStr = @"用户名不合法";
    return NO;
}



@end
