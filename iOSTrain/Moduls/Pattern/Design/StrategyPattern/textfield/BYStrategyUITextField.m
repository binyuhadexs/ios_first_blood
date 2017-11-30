//
//  BYStrategyUITextField.m
//  iOSTrain
//
//  Created by binyu on 2017/11/30.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYStrategyUITextField.h"

@implementation BYStrategyUITextField

- (BOOL)validateInputText{
    return  [_validatestrategy validateTextFieldInput:self];
}


@end
