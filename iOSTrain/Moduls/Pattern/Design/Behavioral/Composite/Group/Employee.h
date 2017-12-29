//
//  Employee.h
//  iOSTrain
//
//  Created by binyu on 2017/12/17.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *dept;
@property(nonatomic,assign) NSInteger salary;
@property(nonatomic,strong) NSMutableArray<Employee *> *subordinates; //子节点


@end
