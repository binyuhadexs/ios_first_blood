//
//  BYDesignPatternViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/27.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYDesignPatternViewController.h"

@interface BYDesignPatternViewController ()



@end
//http://www.runoob.com/design-pattern/design-pattern-tutorial.html

/*
 面向对象设计六大原则
 1、单一责任
 2、开闭原则   修改关闭--扩展开放 ：尽量通过扩展软件实体的行为来实现变化，而不是通过修改已有的代码来实现变化
 3、里氏替换   所有引用基类的地方必须能透明地使用其子类的对象。
 4、依赖倒置   //高层模块不应该依赖低层模块，二者都应该依赖其抽象 抽象不应该依赖细节；细节应该依赖抽象
 5、接口隔离  //建立最小的依赖关系
 6、迪米特原则-(最少知识原则) --> 一个对象应该对其他对象保持最少的了解
 7、合成复用原则   尽量使用对象组合，而不是继承来达到复用的目的
 http://www.uml.org.cn/sjms/201211023.asp#2
 */

/*
 设计模式：特定问题的解决方案
 
 
 */
@implementation BYDesignPatternViewController

- (NSString *)by_fileNamePlistSource{
    return @"designPattern";
}

- (void)by_viewDidLoad{
    self.title = @"设计模式";
}

@end
