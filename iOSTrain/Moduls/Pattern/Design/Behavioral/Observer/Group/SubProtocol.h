//
//  SubProtocol.h
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SubProtocol <NSObject>

- (void)subMessage:(id)message withSubNumber:(NSString *)withSubNumber;

@end
