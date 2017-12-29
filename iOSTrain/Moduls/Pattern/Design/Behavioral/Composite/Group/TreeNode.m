//
//  TreeNode.m
//  iOSTrain
//
//  Created by binyu on 2017/12/17.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode

// 初始化
+ (instancetype)nodeWithData:(NSString *)data{
    TreeNode *node = [[[self class] alloc] init];
    node.data = data;
    return node;
}

@end
