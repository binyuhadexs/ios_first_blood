//
//  FlyweightFactory.m
//  iOSTrain
//
//  Created by binyu on 2017/12/6.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "FlyweightFactory.h"


@interface FlyweightFactory()

@property(nonatomic,strong) NSMutableDictionary *lyingDict; //闲置的
//可以继续做扩展 自己实现tableview的复用

@end

@implementation FlyweightFactory

- (FlyweightView *)viewWithIdentify:(NSString *)identify{

    if (self.lyingDict == nil) {
        self.lyingDict = [[NSMutableDictionary alloc] init];
    }
    
    // 2. 去享元池里面取
    FlyweightView *view = [self.lyingDict objectForKey:identify];
    if (!view) {
        view = [[FlyweightView alloc] initWithFrame:CGRectMake(0, 0, arc4random_uniform(100), arc4random_uniform(100))];
        view.name = identify;
        [self.lyingDict setObject:view forKey:identify];
    }
    return view;
}

@end
