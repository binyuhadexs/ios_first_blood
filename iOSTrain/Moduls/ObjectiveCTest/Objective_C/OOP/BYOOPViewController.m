//
//  BYOOPViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/10/28.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYOOPViewController.h"

@interface BYOOPViewController ()

//@property (nonatomic,a)

@end

@implementation BYOOPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}



/*
 间接（indirection）是OOP的核心。OOP使用间接来获取数据，真正的革命性在于它使用间接来调用代码。不是直接调用某个函数，而是间接调用。
 过程式编程：花时间连接数据和用来处理数据的函数。程序越复杂，扩展性越差。
 
 类(Class)：是一种表示对象类型的结构体。对象通过它的类来获取自身的各种信息，尤其是执行每个操作需要运行的代码。
 对象（Object）：是一种包含值和指向其类的隐藏指针的结构体。对象又称实例（instance）
 消息（message）:对象可以执行的操作，用于通知对象去做什么。
 方法（method）:响应消息而运行的代码。
 方法调度（method dispatcher）用于推测执行什么方法以响应某个特定的消息。
 接口：（interface）是类为对象提供的特性描述。
 实现：（implementation）是使接口正常工作的代码
 
 isa指针
 OC方法调度机制：从类中查找，如果没有就从父类中查找。
 SEL
 对象的存储细节
 
 
 
 */

/*
  OOP三特性：
  继承（inheritance）
  封装
  多态

 */

/*
    复合（composition）
    什么时候使用继承？什么时候使用复合。
    继承 is a
    复合 has a
 */

//偏移量

/*
  数据封装
  @property(原子性、读写权限、内存管理、方法名)
  原子性:(automic,nonatomic)
  读写:(readwrite,readonly)
  内存管理：(assign,strong,weak,copy,unsafe_unretained)
  方法名：getter=<> setter=<>
  @synthesize 默认 @syntheszie var = _var  //如果你没有手动实现 setter 方法和 getter 方法，那么编译器会自动为你加上这两个方法
  @dynamic var // 告诉编译器：属性的 setter 与 getter 方法由用户自己实现，不自动生成.如果不实现，编译的时候没问题，由于缺 setter 方法会导致程序崩溃

 */

/*
 协议
 @protocol
 @required
 @optional
 
 非正式协议
 
 category 分类、类别、类目 //扩展类的功能，而非封装数据
 只读属性可以在分类中使用。
 无法声明属性， 关联对象 可以解决
 
 extention 扩展、延展、匿名分类
 extension在编译期决议，它就是类的一部分
 
 */

/*
 
 
 */




//内存管理
//委托代理模式

/*
 KVC
 https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/KeyValueCoding/CollectionOperators.html#//apple_ref/doc/uid/20002176-BAJEAIEE
 
 http://blog.csdn.net/iunion/article/details/46890809
 KVO
 
 http://blog.csdn.net/kesalin/article/details/8194240
 */







@end
