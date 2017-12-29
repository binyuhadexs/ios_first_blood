//
//  LinekedIterator.m
//  iOSTrain
//
//  Created by binyu on 2017/12/17.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "LinekedIterator.h"

@interface LinekedIterator()

@property(nonatomic,strong)LinkedList *linkedList;
@property(nonatomic,strong)Node *currentNode;

@end

@implementation LinekedIterator

//还可以在LinkedList上实现协议 大多数情况是在集合中实现

+(instancetype)linkedListIterator:(LinkedList *)linkedList{
    LinekedIterator *iterator = [[LinekedIterator alloc] init];
    iterator.linkedList = linkedList;
    iterator.currentNode = linkedList.headNode;
    return iterator;
    
}

-(id)nextObject{
//    id obj = _currentNode.data;
    _currentNode = _currentNode.nextNode; //第一个节点 不放数据 实现不一样
    return _currentNode.data;
}

- (BOOL)hasNext{
    return _currentNode.nextNode?YES:NO;
}

@end
