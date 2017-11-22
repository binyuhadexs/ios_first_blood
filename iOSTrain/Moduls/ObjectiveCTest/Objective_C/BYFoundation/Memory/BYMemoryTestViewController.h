//
//  BYMemoryTestViewController.h
//  iOSTrain
//
//  Created by binyu on 2017/11/21.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYViewController.h"

@interface BYMemoryTestViewController : BYViewController
/*
 @property
 1原则性 atomic,nonatomic 默认atomic ——>自旋锁？？
 2读写 readonly,readwrite 默认readwrite
 3设置方法名 getter,setter=<#method#>
 4内存管理
     assign
     retain
     copy
     strong
     unsafe_unretained
     null_unspecified
     null_resettable
 
 */

@property(null_resettable) ;

@end
