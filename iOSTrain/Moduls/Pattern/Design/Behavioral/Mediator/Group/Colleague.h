//
//  Colleague.h
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "AbstrctColleague.h"
#import <UIKit/UIKit.h>

@interface Colleague : AbstrctColleague

@property (nonatomic, assign) CGFloat value;

// 修改数值
- (void)changeValue:(CGFloat)value;

@end
