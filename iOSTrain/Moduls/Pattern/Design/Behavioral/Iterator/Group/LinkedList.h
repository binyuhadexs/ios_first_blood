//
//  LinkedList.h
//  iOSTrain
//
//  Created by binyu on 2017/12/17.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"
//#import "LinekedIterator.h"

@interface LinkedList : NSObject

@property(nonatomic,strong) Node *headNode;
@property(nonatomic,assign) NSInteger count; //数量

-(void)addData:(id)data;

//测试 不要暴露内部数据结构给外部
-(void)addNode:(Node*)node;

@end
