//
//  BlindMonk.m
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BlindMonk.h"


@interface BlindMonk()

@property (nonatomic,copy) NSString *name;

@end

@implementation BlindMonk

- (instancetype)initWithName:(NSString *)name{
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

- (void)learnSkills{
    NSLog(@"%@学习了以上技能！",_name);
}

@end
