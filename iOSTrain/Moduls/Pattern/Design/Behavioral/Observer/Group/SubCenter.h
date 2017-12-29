//
//  SubCenter.h
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SubProtocol.h"

@interface SubCenter : NSObject

// 创建书刊订阅号
+ (void)creatNumber:(NSString *)subNumber;

// 移除订阅号
+ (void)removeNumber:(NSString *)subNumber;

// 添加用户
+ (void)addUser:(id <SubProtocol>)user wihtNumber:(NSString *)userNumber;

// 移除用户
+ (void)removeUser:(id <SubProtocol>)user withNumber:(NSString *)userNumber;

// 发送消息
+ (void)sendMessage:(id)message withSubNumber:(NSString *)SubNumber;

@end
