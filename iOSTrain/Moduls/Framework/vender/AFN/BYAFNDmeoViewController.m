//
//  BYAFNDmeoViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/12/20.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYAFNDmeoViewController.h"
#import <AFNetworking.h>
//#import <AF>

@interface BYAFNDmeoViewController ()

@end

@implementation BYAFNDmeoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    AFNE
}

- (void)ADN{
    
  AFHTTPSessionManager *manager =  [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    [manager GET:@"" parameters:@"" progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

NSString * abc(NSDictionary *parameters) {
    NSMutableArray *mutablePairs = [NSMutableArray array];

    
    return [mutablePairs componentsJoinedByString:@"&"];
}

@end
