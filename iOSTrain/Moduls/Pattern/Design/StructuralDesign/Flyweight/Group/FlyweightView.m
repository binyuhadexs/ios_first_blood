//
//  FlyweightView.m
//  iOSTrain
//
//  Created by binyu on 2017/12/6.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "FlyweightView.h"

@implementation FlyweightView


-(void)removeFromSuperview{
    [super removeFromSuperview];
    
}

-(NSUInteger)hash{
    return  [self.name hash];
}

@end
