//
//  Skill_Q.m
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "Skill_Q.h"

@interface Skill_Q()

@property (nonatomic,copy) NSString *skillName;

@end

@implementation Skill_Q

- (instancetype)initWithHero:(Hero *)hero skillName:(NSString *)name{
    self = [super initWithHero:hero];
    if (self) {
        self.skillName = name;
    }//
    return self;
}
- (void)learnSkills{
     NSLog(@"学习了技能%@",self.skillName);
     [super learnSkills];
}


@end
