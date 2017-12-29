//
//  BYMVCView.h
//  iOSTrain
//
//  Created by binyu on 2017/12/2.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYMVCModel.h"

@protocol BYMVCViewDelegete<NSObject>

- (void)changeName;

@end


@interface BYMVCView : UIView

@property (nonatomic,weak)id<BYMVCViewDelegete> delegate;

- (void)showUserInfo:(BYMVCModel *)model;

@end
