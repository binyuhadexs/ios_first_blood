//
//  Remote.h
//  BridgeDemo
//
//  Created by James on 2017/12/5.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TV.h"

@interface Remote : NSObject
@property (nonatomic, strong) TV *tv;

- (void)setCommand:(NSString *)commmand;
@end
