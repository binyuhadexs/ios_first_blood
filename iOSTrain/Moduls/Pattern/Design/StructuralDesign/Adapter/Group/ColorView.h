//
//  ColorView.h
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CVModel.h"
#import "TargeyProtocol.h"

@interface ColorView : UIView

// 加载数据, 已经实现了TargeyProtocol里面的要求
- (void)loadModel:(id <TargeyProtocol>)model;

//TODO
//- (void)loadModel:(CVModel *)model;

@end
