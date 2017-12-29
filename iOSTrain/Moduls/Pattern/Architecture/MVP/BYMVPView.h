//
//  BYMVPView.h
//  iOSTrain
//
//  Created by binyu on 2017/12/3.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BYMVPViewDelegete<NSObject>

- (void)changeName;

@end

@interface BYMVPView : UIView

@property (nonatomic,weak)id<BYMVPViewDelegete> delegate;

- (void)showUserName:(NSString *)name;

@end
