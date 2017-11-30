//
//  BYStrategyPatternViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/29.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYStrategyPatternViewController.h"
#import "BYStrategyContext.h"
#import "BYStrategyB.h"
#import "BYStrategyA.h"
#import "BYStrategyUITextField.h"

#import "BYNumberValidationStrategy.h"
#import "BYLettersValidationStrategy.h"
#import "BYUserNameValidationStrategy.h"
#import "BYNicknameValidationStrategy.h"

@interface BYStrategyPatternViewController ()

@property (nonatomic,strong)BYStrategyContext *context;
@property (weak, nonatomic) IBOutlet BYStrategyUITextField *numberTextField;
@property (weak, nonatomic) IBOutlet BYStrategyUITextField *letterTextField;
@property (weak, nonatomic) IBOutlet BYStrategyUITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet BYStrategyUITextField *nicknameTextField;

@end
//http://www.runoob.com/design-pattern/strategy-pattern.html

/*
 策略模式
 主要解决：在有多种算法相似的情况下，使用 if...else 所带来的复杂和难以维护。
 
 
 */

@implementation BYStrategyPatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.context =  [BYStrategyContext new];
    self.numberTextField.validatestrategy = [BYNumberValidationStrategy new];
   
    BYLettersValidationStrategy *strateg =  [BYLettersValidationStrategy new]; //还可以继续封装
    strateg.inputLength = 5;
    self.letterTextField.validatestrategy = strateg;
    
    self.usernameTextField.validatestrategy = [BYUserNameValidationStrategy new];
    self.nicknameTextField.validatestrategy = [BYNicknameValidationStrategy new];
    self.numberTextField.placeholder = @"纯数字";
     self.letterTextField.placeholder = @"纯字母";
     self.usernameTextField.placeholder = @"字母加汉子";
     self.nicknameTextField.placeholder = @"数字加字母";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self demo];
   [self demo1];
}

- (void)demo{
    self.context.strategy = [BYStrategyB new];
    [self.context doOperaterOne:10 two:20];
}

- (void)demo1{
    self.context.strategy = [BYStrategyA new];
    [self.context doOperaterOne:10 two:20];
}


- (IBAction)submit:(id)sender {
    if ([self.numberTextField validateInputText]) {
        NSLog(@"%@",self.numberTextField.text);
    }else {
        NSLog(self.numberTextField.validatestrategy.validateResultStr);
    }
    if ([self.letterTextField validateInputText]) {
        NSLog(@"%@",self.letterTextField.text);
    }else {
        NSLog(self.letterTextField.validatestrategy.validateResultStr);
    }
    if ([self.usernameTextField validateInputText]) {
        NSLog(@"%@",self.usernameTextField.text);
    }else {
        NSString *result = self.usernameTextField.validatestrategy.validateResultStr;
        NSLog(@"%@",result);
    }
    if ([self.nicknameTextField validateInputText]) {
        NSLog(@"%@",self.nicknameTextField.text);
    }else {
        NSLog(self.nicknameTextField.validatestrategy.validateResultStr);
    }
    
//    self.numberTextField.validatestrategy = [BYNumberValidationStrategy new];
//    self.letterTextField.validatestrategy = [BYLettersValidationStrategy new];
//    self.usernameTextField.validatestrategy = [BYNumberValidationStrategy new];
//    self.nicknameTextField.validatestrategy = [BYNicknameValidationStrategy new];
}


@end
