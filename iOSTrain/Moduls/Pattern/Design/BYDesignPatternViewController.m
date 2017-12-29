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


/*
 框架和设计模式
 框架通常是代码重用，而设计模式是设计重用，架构则介于两者之间，部分代码重用，部分设计重用，有时分析也可重用。在软件生产中有三种级别的重用：内部重用，即在同一应用中能公共使用的抽象块;代码重用，即将通用模块组合成库或工具集，以便在多个应用和领域都能使用；应用框架的重用，即为专用领域提供通用的或现成的基础结构，以获得最高级别的重用性。
 
 
 */

/*
 创建型模式，共五种：工厂方法模式、抽象工厂模式、单例模式、建造者模式、原型模式。
 结构型模式，共七种：适配器模式、装饰器模式、代理模式、外观模式、桥接模式、组合模式、享元模式。
 行为型模式，共十一种：策略模式、模板方法模式、观察者模式、迭代子模式、责任链模式、命令模式、备忘录模式、状态模式、访问者模式、中介者模式、解释器模式。
 
 */

@implementation BYDesignPatternViewController

- (NSString *)by_fileNamePlistSource{
    return @"designPattern";
}

- (void)by_viewDidLoad{
    self.title = @"设计模式";
}

@end
