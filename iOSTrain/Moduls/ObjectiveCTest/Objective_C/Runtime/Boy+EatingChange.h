//
//  Boy+EatingChange.h
//  iOSTrain
//
//  Created by binyu on 2017/11/19.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "Boy.h"

@interface Boy (EatingChange)

@property (strong, nonatomic) NSString *associatedObjectStr;

-(void)exchange_eating;
-(void)removeAssociatedObjectStr;

@end
