//
//  SubRemote.m
//  BridgeDemo
//
//  Created by James on 2017/12/5.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "SubRemote.h"

@implementation SubRemote
// 方向控制
- (void)up {
    [super setCommand:@"up"];
}
- (void)down {
    [super setCommand:@"down"];

}
- (void)left {
    [super setCommand:@"left"];

}
- (void)right {
    [super setCommand:@"right"];

}
@end
