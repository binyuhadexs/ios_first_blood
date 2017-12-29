//
//  Colleague.m
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "Colleague.h"

@implementation Colleague

- (void)changeValue:(CGFloat)value {
    self.value = value;
    if (self.delegate && [self.delegate respondsToSelector:@selector(colleagueEvent:)]) {
        
        [self.delegate colleagueEvent:self];
    }
}

@end
