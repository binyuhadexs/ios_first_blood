//
//  TVKJ.m
//  BridgeDemo
//
//  Created by James on 2017/12/5.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "TVKJ.h"

@implementation TVKJ
- (void)loadCommand:(NSString *)command {
    
    if ([command isEqualToString:@"up"]) {
        NSLog(@"您按的是KJ:----%@",command);
    }
    else if ([command isEqualToString:@"down"]){
        NSLog(@"您按的是KJ:----%@",command);
    }
    else if ([command isEqualToString:@"left"]){
        NSLog(@"您按的是KJ:----%@",command);
    }
    else if ([command isEqualToString:@"right"]){
        NSLog(@"您按的是KJ:----%@",command);
    }
    else {
        NSLog(@"超出范围");
    }
}
@end
