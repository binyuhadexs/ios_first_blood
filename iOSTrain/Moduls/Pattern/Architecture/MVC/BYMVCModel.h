//
//  BYMVCModel.h
//  iOSTrain
//
//  Created by binyu on 2017/12/2.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYObject.h"

@interface BYMVCModel : BYObject

@property(nonatomic,strong) NSString *name;
@property(nonatomic,assign) NSInteger age;

+ (BYMVCModel *)getUser;

- (void)changeName:(NSString *)name;

- (void)changeName:(NSString *)name result:(void(^)(NSString *))result;


@end
