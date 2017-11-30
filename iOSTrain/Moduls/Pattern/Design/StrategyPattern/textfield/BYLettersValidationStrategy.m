//
//  BYLettersValidationStrategy.m
//  iOSTrain
//
//  Created by binyu on 2017/11/30.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYLettersValidationStrategy.h"

@implementation BYLettersValidationStrategy

 //校验是否是数字
- (BOOL)validateTextFieldInput:(UITextField *)textfield{
    NSString *checkString =textfield.text;
    if (checkString.length < self.inputLength) {
        self.validateResultStr =  [NSString stringWithFormat:@"不能少于%ld位",self.inputLength];
        return NO;
    }
    
    //正则表达式
    NSString *pattern = @"^[a-zA-Z]*$";
    NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray *results = [regular matchesInString:checkString options:0 range:NSMakeRange(0, checkString.length)];
    if (results.count==1) {
        return YES;
    }
   self.validateResultStr = @"包含非字母";
    return NO;
}



@end
