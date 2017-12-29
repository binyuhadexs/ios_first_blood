//
//  OneMediator.h
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "AbstractMediator.h"
#import "Colleague.h"

@interface OneMediator : AbstractMediator

@property (nonatomic, strong) Colleague *colleagueA;
@property (nonatomic, strong) Colleague *colleagueB;
@property (nonatomic, strong) Colleague *colleagueC;


- (NSDictionary *)values;


@end
