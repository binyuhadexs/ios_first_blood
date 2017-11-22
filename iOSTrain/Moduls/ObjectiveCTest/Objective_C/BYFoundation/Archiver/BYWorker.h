//
//  BYWorker.h
//  iOSTrain
//
//  Created by binyu on 2017/11/21.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYObject.h"

@interface BYWorker : NSObject<NSCoding>

@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign) NSInteger age;


@end
