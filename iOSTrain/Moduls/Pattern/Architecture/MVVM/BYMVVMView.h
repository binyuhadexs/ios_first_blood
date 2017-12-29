//
//  BYMVVMView.h
//  iOSTrain
//
//  Created by binyu on 2017/12/3.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYMVVMViewModel.h"


@protocol BYMVVMViewDelegete<NSObject>

- (void)changeName;

@end

@interface BYMVVMView : UIView


@property (nonatomic,strong) BYMVVMViewModel *viewModel;
//@property (nonatomic,weak)id<BYMVVMViewDelegete> delegate;

- (void)showViewModel:(BYMVVMViewModel *)vm;

@end
