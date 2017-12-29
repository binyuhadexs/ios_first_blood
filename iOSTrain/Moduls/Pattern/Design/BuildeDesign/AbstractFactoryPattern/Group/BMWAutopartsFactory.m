//
//  BMWAutopartsFactory.m
//  iOSTrain
//
//  Created by binyu on 2017/12/6.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BMWAutopartsFactory.h"
#import "BMWEngine.h"
#import "MicheniTyre.h"

@implementation BMWAutopartsFactory

- (Engine *)buildEngine{
    return [[BMWEngine alloc] init];
}
- (Tyre *)buildTyre{
    return [[MicheniTyre alloc] init];
}

@end
