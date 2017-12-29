//
//  Note.h
//  iOSTrain
//
//  Created by binyu on 2017/12/17.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property(nonatomic,strong) Node *nextNode;
@property(nonatomic,strong) id data; //数据

+(instancetype)nodeData:(id)data;

@end
