//
//  BYMVVMViewModel.h
//  iOSTrain
//
//  Created by binyu on 2017/12/3.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYObject.h"
#import "BYMVVMModel.h"
#import "NSObject+FBKVOController.h"
//#import "BYMVVMView.h"

@interface BYMVVMViewModel : BYObject

@property (nonatomic, copy) NSString *nameStr;

@property (nonatomic, copy) NSString *showLoading;

@property (nonatomic,strong) BYMVVMModel *model;
//@property (nonatomic,strong) BYMVVMView *view;

- (void)changeNmae;
- (void)login;

@end
