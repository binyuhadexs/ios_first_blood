//
//  BYStrategyUITextField.h
//  iOSTrain
//
//  Created by binyu on 2017/11/30.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextFieldValidationStrategy.h"

@interface BYStrategyUITextField : UITextField

@property(nonatomic,strong)UITextFieldValidationStrategy *validatestrategy;

- (BOOL)validateInputText;


@end
