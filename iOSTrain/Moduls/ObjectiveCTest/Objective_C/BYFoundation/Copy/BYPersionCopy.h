//
//  BYPersionCopy.h
//  iOSTrain
//
//  Created by binyu on 2017/11/21.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYObject.h"

@interface BYPersionCopy : BYObject<NSCopying,NSMutableCopying>

@property (nonatomic,copy) NSString *name;
@property (nonatomic,strong) NSString *avar;
@property (nonatomic,strong) NSArray *schoolmates;

@end
