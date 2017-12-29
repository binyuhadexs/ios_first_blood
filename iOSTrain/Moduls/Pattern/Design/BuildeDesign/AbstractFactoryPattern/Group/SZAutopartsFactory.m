//
//  SZAutopartsFactory.m
//  iOSTrain
//
//  Created by binyu on 2017/12/6.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "SZAutopartsFactory.h"

#import "BYDEngine.h"
#import "ChinaTyre.h"


@implementation SZAutopartsFactory

- (Engine *)buildEngine{
    return [[BYDEngine alloc] init];
}
- (Tyre *)buildTyre{
    return [[ChinaTyre alloc] init];
}

@end
