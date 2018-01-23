//
//  NetworkTools.h
//  iOSTrain
//
//  Created by binyu on 2018/1/5.
//  Copyright © 2018年 binyu. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "ReactiveObjC.h"

@interface NetworkTools : AFHTTPSessionManager

+ (instancetype)sharedTools;
- (RACSignal *)request:(NSString *)URLString parameters:(id)parameters;

@end
