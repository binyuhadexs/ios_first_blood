//
//  Remote.m
//  BridgeDemo
//
//  Created by James on 2017/12/5.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "Remote.h"

@implementation Remote
- (void)setCommand:(NSString *)commmand {
    [self.tv loadCommand:commmand];
}
@end
