//
//  BaseCopyObject.h
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseCopyObject : NSObject <NSCopying>

- (void)copyOperationWithObject:(id)object;



@end
