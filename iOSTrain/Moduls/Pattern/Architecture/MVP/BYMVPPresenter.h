//
//  BYMVPPresenter.h
//  iOSTrain
//
//  Created by binyu on 2017/12/3.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYObject.h"

@interface BYMVPViewModel : BYObject;

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *address;


@end


//
@protocol BYMVPPresenterDelegete<NSObject>

-(void)showLoadingView;
-(void)hideLoadingView;
-(void)showUserName:(NSString *)name;

@end

@protocol BYMVPPresenterAction<NSObject>

- (void)login;
- (void)logout;

@end


@interface BYMVPPresenter : BYObject <BYMVPPresenterAction>


@property(nonatomic,weak)id<BYMVPPresenterDelegete> delegete;

- (instancetype)initWithDelegete:(id)delegate;

//

- (void)getUserInfo;
- (void)changeUserName:(NSString *)name;



@end
