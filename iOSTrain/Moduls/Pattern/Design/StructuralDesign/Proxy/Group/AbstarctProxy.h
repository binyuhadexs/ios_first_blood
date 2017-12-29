//
//  AbstarctProxy.h
//  iOSTrain
//
//  Created by binyu on 2017/12/12.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AbstarctProxy : NSProxy

// 代理属性
@property (nonatomic, weak) id delegate;

@end
