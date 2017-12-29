//
//  LinkedList.m
//  iOSTrain
//
//  Created by binyu on 2017/12/17.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "LinkedList.h"



@implementation LinkedList

-(instancetype)init{
    if (self == [super init]) {
        self.headNode = [Node new]; //第一个节点不放数据 。。 也可以放数据
    }
    return  self;
}

-(void)addData:(id)data{
    if (!self.headNode) {
        self.headNode = [Node nodeData:data];
    } else {
        [self addData:data withNode:self.headNode];
    }
    _count++;
}

-(void)addNode:(Node*)node{
    if (!self.headNode) {
        self.headNode = node;
    } else {
        [self addNode:node withNextNode:self.headNode.nextNode];
    }
    _count++;
}


-(void)addNode:(Node*)node withNextNode:(Node *)nextNode{
    if (!nextNode.nextNode) {
        nextNode.nextNode = node;
    } else {
        [self addNode:node withNextNode:nextNode.nextNode];
    }
}


- (void)addData:(id)data withNode:(Node *)node{
    if (node.nextNode == nil) {
        node.nextNode = [Node nodeData:data];
    } else {
        [self addData:data withNode:node.nextNode];
    }
}

//-(LinekedIterator *)linkedListIterator{
//    LinekedIterator *iterator = [[LinekedIterator alloc] init];
//    iterator.linkedList = self;
//    iterator.currentNode = self.headNode;
//    return iterator;
//
//}

@end
