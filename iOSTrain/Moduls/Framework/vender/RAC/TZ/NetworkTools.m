//
//  NetworkTools.m
//  iOSTrain
//
//  Created by binyu on 2018/1/5.
//  Copyright © 2018年 binyu. All rights reserved.
//

#import "NetworkTools.h"

@implementation NetworkTools:AFHTTPSessionManager

+ (instancetype)sharedTools{
    static NetworkTools * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] initWithBaseURL:nil];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html" ,nil];
        
    });
    
    return instance;
}


-(RACSignal *)request:(NSString *)URLString parameters:(id)parameters {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [self GET:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@",responseObject);
            
            [subscriber sendNext:responseObject];
            
            [subscriber sendCompleted];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
            
            [subscriber sendError:error];
        }];
        
        return nil;
    }];
}



@end
