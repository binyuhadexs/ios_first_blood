//
//  TV.h
//  BridgeDemo
//
//  Created by James on 2017/12/5.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TV : NSObject
// 电视机提供给外界调用的一个方法
- (void)loadCommand:(NSString *)command;

@end
