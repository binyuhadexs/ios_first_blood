//
//  FlyweightFactory.h
//  iOSTrain
//
//  Created by binyu on 2017/12/6.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYObject.h"
#import "FlyweightView.h"

@interface FlyweightFactory : BYObject

- (FlyweightView *)viewWithIdentify:(NSString *)identify;

@end
