//
//  OneMediator.m
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "OneMediator.h"

@implementation OneMediator

// 主要用来查看打印信息.
- (NSDictionary *)values {
    return @{@"A":@(self.colleagueA.value),
             @"B":@(self.colleagueB.value),
             @"C":@(self.colleagueC.value),
             };
}


// 指定算法.
- (void)colleagueEvent:(AbstrctColleague *)event {
    if ([event isEqual:self.colleagueA]) {
        self.colleagueB.value = self.colleagueA.value * 2;
        self.colleagueC.value = self.colleagueA.value * 4;
        
    } else if ([event isEqual:self.colleagueB]) {
        self.colleagueA.value = self.colleagueB.value / 2.f;
        self.colleagueC.value = self.colleagueB.value * 2.f;
    } else {
        self.colleagueA.value = self.colleagueC.value / 4.f;
        self.colleagueB.value = self.colleagueC.value / 2.f;
    }
}

@end
