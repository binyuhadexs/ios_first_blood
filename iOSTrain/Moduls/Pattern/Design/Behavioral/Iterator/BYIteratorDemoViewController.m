//
//  BYIteratorDemoViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/12/17.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYIteratorDemoViewController.h"
#import "LinkedList.h"
#import "LinekedIterator.h"
#import "Node.h"

/*
 迭代器模式
 提供一种方法顺序访问一个聚合对象中各个元素, 而又无须暴露该对象的内部表示。
 主要解决：不同的方式来遍历整个整合对象。
 何时使用：遍历一个聚合对象。
 如何解决：把在元素之间游走的责任交给迭代器，而不是聚合对象。
 
 */
@interface BYIteratorDemoViewController ()

@end

@implementation BYIteratorDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self demo1];
    [self demo2];
}


- (void)demo2{
    LinkedList *list = [[LinkedList alloc] init];
    [list addData:@"1231"];
    [list addData:@"1232"];
    [list addData:@"1233"];
    [list addData:@"1234"];
    [list addData:@"1235"];
    [list addData:@"1235"];
    
//    Node *node1 = [Node nodeData:@"121"];
//    Node *node2 = [Node nodeData:@"122"];
//    Node *node3 = [Node nodeData:@"123"];
//    Node *node4 = [Node nodeData:@"124"];
//    [list addNode:node1]; //
//    [list addNode:node2];
//    [list addNode:node3];
//    [list addNode:node4];
    
   LinekedIterator *iterator =  [LinekedIterator linkedListIterator:list];
    while (iterator.hasNext) {
       NSString *obj= iterator.nextObject;
       NSLog(@"%@",(NSString *)obj);
    }
}

- (void)demo1{
    NSArray *data = @[@"1",@"2",@"3",@"4"];
    NSEnumerator *enumerator = [data objectEnumerator];
    
    id obj;
    while (obj= [enumerator nextObject]) {
        NSLog(@"%@",obj);
    }
}


@end
