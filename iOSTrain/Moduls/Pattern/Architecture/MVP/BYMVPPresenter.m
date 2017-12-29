//
//  BYMVPPresenter.m
//  iOSTrain
//
//  Created by binyu on 2017/12/3.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYMVPPresenter.h"
#import "BYMVPModel.h"

//用于封装界面展示数据  如果业务逻辑简单 项目简单就没有必要
@implementation BYMVPViewModel
@end


@interface BYMVPPresenter()<BYMVPPresenterAction>

@property (nonatomic,strong) BYMVPModel *model;

@end
@implementation BYMVPPresenter

- (instancetype)initWithDelegete:(id)delegate{
    if (self = [super init]) {
         self.delegete = delegate;
    }
    return self;
}


- (void)login{
    NSLog(@"LOGIN");
}

- (void)logout{
    NSLog(@"logout");
}


- (void)getUserInfo{
   self.model =  [BYMVPModel getUser];
   [self.delegete showUserName:_model.name];
}

- (void)changeUserName:(NSString *)name{
    [self.delegete showLoadingView];
    self.model.name = name;
    [self.delegete showUserName:name];
    [self.delegete hideLoadingView];
}

@end
