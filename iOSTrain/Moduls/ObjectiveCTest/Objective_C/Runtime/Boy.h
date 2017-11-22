//
//  Boy.h
//  iOSTrain
//
//  Created by binyu on 2017/11/19.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Boy : NSObject

@property (nonatomic,strong) NSString *name;

+(void)run;

-(void)run;

-(void)eatWithFoot:(NSString *)foot;

-(void)drink;

-(void)eating;

-(void)study;

@end
