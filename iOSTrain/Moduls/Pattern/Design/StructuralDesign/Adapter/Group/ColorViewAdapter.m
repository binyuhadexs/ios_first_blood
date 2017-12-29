//
//  ColorViewAdapter.m
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "ColorViewAdapter.h"

@implementation ColorViewAdapter

- (instancetype)initWithModel:(id)model {
    self = [super init];
    if (self) {
        self.model = model;
    }
    return self;
}

- (UIColor *)smallViewColor {
    NewVCModel *model = self.model;
    
    // 如果传入的数据, 是二进制的. 这边就需要判断
    if ([model.smallViewColor isEqualToString:@"blue"]) {
        return [UIColor  blueColor];
    } else if ([model.smallViewColor isEqualToString:@"yellow"]) {
        return [UIColor  yellowColor];
    }else {
        return [UIColor redColor];
    }
}

- (NSString *)userName {
    NewVCModel *model = self.model;
    return model.userName;
}

- (NSString *)password {
    NewVCModel *model = self.model;
    return model.password;
}



@end
