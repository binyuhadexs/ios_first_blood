//
//  AutopartsFactory.h
//  iOSTrain
//
//  Created by binyu on 2017/12/6.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYObject.h"
#import "Engine.h"
#import "Tyre.h"

@interface AutopartsFactory : BYObject

- (Engine *)buildEngine;
- (Tyre *)buildTyre;

@end
