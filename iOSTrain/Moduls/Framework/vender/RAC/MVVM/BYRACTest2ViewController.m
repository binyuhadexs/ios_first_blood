//
//  BYRACTest2ViewController.m
//  iOSTrain
//
//  Created by binyu on 2018/1/5.
//  Copyright © 2018年 binyu. All rights reserved.
//

#import "BYRACTest2ViewController.h"
#import "LoginViewModel.h"

@interface BYRACTest2ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountText;
@property (weak, nonatomic) IBOutlet UITextField *pwdText;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;


// ViewModel
@property(strong, nonatomic)LoginViewModel * loginVM;
@end

@implementation BYRACTest2ViewController

-(LoginViewModel *)loginVM{
    if (!_loginVM) {
        _loginVM = [[LoginViewModel alloc]init];
    }
    return _loginVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RAC(self.loginVM, account) = _accountText.rac_textSignal;
    RAC(self.loginVM, pwd) = _pwdText.rac_textSignal;
    RAC(_loginButton, enabled) = self.loginVM.loginEnableSignal;
    
    [[_loginButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"當我的時候要做的事情");
        [self.loginVM.loginCommand execute:nil]; // 街收到命令
    }];
}



@end
