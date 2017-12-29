//
//  TreeNode.h
//  iOSTrain
//
//  Created by binyu on 2017/12/17.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TreeNode : NSObject
// 当前节点的名字
@property (nonatomic, copy) NSString *data;

// 左节点
@property (nonatomic, strong) TreeNode *leftNode;

// 右节点
@property (nonatomic, strong) TreeNode *rightNode;

// 初始化
+ (instancetype)nodeWithData:(NSString *)data;

@end
