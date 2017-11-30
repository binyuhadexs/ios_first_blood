//
//  BYStrategyContext.h
//  iOSTrain
//
//  Created by binyu on 2017/11/29.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYObject.h"
@class BYStrategy;

@interface BYStrategyContext : BYObject

@property(nonatomic,strong) BYStrategy *strategy;

//+ (void)strategyTest:(BYStrategy *)strategy;
- (void)doOperaterOne:(NSInteger)one two:(NSInteger)two;

@end
