//
//  Note.m
//  iOSTrain
//
//  Created by binyu on 2017/12/17.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "Node.h"

@implementation Node

+(instancetype)nodeData:(id)data{
    Node *node =  [[self alloc] init];
    node.data = data;
    return node;
}


@end
