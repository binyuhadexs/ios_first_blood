//
//  IteratorProtocol.h
//  iOSTrain
//
//  Created by binyu on 2017/12/17.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IteratorProtocol <NSObject>

-(id)nextObject;
- (BOOL)hasNext;

@end
