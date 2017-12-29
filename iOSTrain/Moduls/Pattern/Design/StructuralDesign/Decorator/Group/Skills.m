//
//  Skills.m
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "Skills.h"

@interface Skills()

@property (nonatomic,strong) Hero *hero;

@end

@implementation Skills

- (instancetype)initWithHero:(Hero *)hero{
    self = [super init];
    if (self) {
        self.hero = hero;
    }
    return self;
}

- (void)learnSkills{
    [self.hero learnSkills];
}

@end
