//
//  BaseCopyObject.m
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BaseCopyObject.h"

@implementation BaseCopyObject

- (id)copyWithZone:(NSZone *)zone{
    BaseCopyObject *copyObject = [[self class] allocWithZone:zone];
    // 赋值操作
    [self copyOperationWithObject:copyObject];
    
    return copyObject;
}

- (void)copyOperationWithObject:(id)object {
    
}


@end
