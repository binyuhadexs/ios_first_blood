//
//  BYKVCTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/23.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYKVCTestViewController.h"
#import "BYKVCModel.h"


@interface BYKVCTestViewController ()

@property (nonatomic,strong) BYKVCModel *model;

@end
//http://www.jianshu.com/p/d54af904967b
/*
  KVC -- key value coding
  NSKeyValueCoding
 
 1、KVC如何访问属性值??
 KVC按顺序使用如下技术：
 ①检查是否存在-<key>、-is<key>（只针对布尔值有效）或者-get<key>的访问器方法，如果有可能，就是用这些方法返回值；
 检查是否存在名为-set<key>:的方法，并使用它做设置值。对于-get<key>和-set<key>:方法，将大写Key字符串的第一个字母，并与Cocoa的方法命名保持一致；
 ②如果上述方法不可用，则检查名为-_<key>、-_is<key>（只针对布尔值有效）、-_get<key>和-_set<key>:方法；
 ③如果没有找到访问器方法，可以尝试直接访问实例变量。实例变量可以是名为：<key>或_<key>;
 ④如果仍为找到，则调用valueForUndefinedKey:和setValue:forUndefinedKey:方法。这些方法的默认实现都是抛出异常，我们可以根据需要重写它们
 
 */

/*
 -valueForKey:
 -valueForKeyPath:
 -dictionaryWithValuesForKeys:
 -valueForUndefinedKey:
 -mutableArrayValueForKey:
 -mutableArrayValueForKeyPath:
 -mutableSetValueForKey:
 -mutableSetValueForKeyPath:
 -mutableOrderedSetValueForKey:
 -mutableOrderedSetValueForKeyPath:
 
 */

/*
 -setValue:forKeyPath:
 -setValuesForKeysWithDictionary:
 -setNilValueForKey:
 -setValue:forKey:
 -setValue:forUndefinedKey:
 */

@implementation BYKVCTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[BYKVCModel alloc] init];
    self.model.mode = [[BYKVCModel alloc] init];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //    [self.model setValue:nil forKey:@"up"];
    [self.model setValue:@"zhangsan" forKey:@"name"];
    [self.model setValue:@"zhangsan1" forKeyPath:@"mode.name"];
    NSLog(@"name=%@",[self.model valueForKey:@"name"]);
    NSLog(@"name=%@",self.model.mode.name);
}



@end
