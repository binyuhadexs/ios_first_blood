//
//  ClassModel.m
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "ClassModel.h"

@implementation ClassModel

- (void)copyOperationWithObject:(ClassModel *)object {
    object.className = self.className;
    // 深拷贝
    object.students = [[NSArray alloc] initWithArray:self.students copyItems:YES];
    
}

@end
