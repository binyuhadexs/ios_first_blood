//
//  BYMVPModel.h
//  iOSTrain
//
//  Created by binyu on 2017/12/3.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYObject.h"

@interface BYMVPModel : BYObject

@property(nonatomic,strong) NSString *name;
@property(nonatomic,assign) NSInteger age;

+ (BYMVPModel *)getUser;

- (void)changeName:(NSString *)name;

@end
