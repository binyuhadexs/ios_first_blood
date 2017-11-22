//
//  BYFoundationTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/10/28.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYFoundationTestViewController.h"

@interface BYFoundationTestViewController ()

@end
//http://www.jianshu.com/p/3f13cc045b97  |||||
//http://www.jianshu.com/p/6aa0233ba48f
/*
 Protocol
 
 */


/*
 Category 分类
 场景主要有三个：
 给现有的类添加方法；
 将一个类的实现拆分成多个独立的源文件；
 声明私有的方法。
 
 实现原理：
 
 Category 中的实例方法和属性被整合到主类中；而类方法则被整合到元类中
 extension 扩展
 
 Extension与Category区别
 Extension
 在编译器决议，是类的一部分，在编译器和头文件的@interface和实现文件里的@implement一起形成了一个完整的类。
 伴随着类的产生而产生，也随着类的消失而消失。
 Extension一般用来隐藏类的私有消息，你必须有一个类的源码才能添加一个类的Extension，所以对于系统一些类，如NSString，就无法添加类扩展
 Category
 是运行期决议的
 类扩展可以添加实例变量，分类不能添加实例变量
 原因：因为在运行期，对象的内存布局已经确定，如果添加实例变量会破坏类的内部布局，这对编译性语言是灾难性的。
 */

//Objective-C 对象模型
//http://blog.leichunfeng.com/blog/2015/04/25/objective-c-object-model/
/*
 objc_class
 struct objc_class {
 Class _Nonnull isa  OBJC_ISA_AVAILABILITY;// 实例对象有个isa的属性,指向Class, 而Class里也有个isa的属性, 指向meteClass.
 Class _Nullable super_class       //指向该类的父类, 如果该类已经是最顶层的根类(如 NSObject 或 NSProxy),那么 super_class 就为 NULL.
 const char * _Nonnull name        //类的名字
 long version                  //类的版本信息,默认为0
 long info     //供运行期使用的一些位标识。如：CLS_CLASS (0x1L)表示该类为普通class; CLS_META(0x2L)表示该类为metaclass等(runtime.h中有详细列出)
 long instance_size            //该类的实例变量大小
 struct objc_ivar_list * _Nullable ivars    // 该类的成员变量链表--内存地址??
 struct objc_method_list * _Nullable * _Nullable methodLists    //方法定义的数组 二维数组
 struct objc_cache * _Nonnull cache                       //最近使用的方法.用于方法调用的优化.
 struct objc_protocol_list * _Nullable protocols         //协议链表
 #endif
 
 } OBJC2_UNAVAILABLE;
 */
/*
 objc_ivar_list和objc_method_list的定义
 //objc_ivar_list结构体存储objc_ivar数组列表
 
 struct objc_ivar_list {
 int ivar_count
 #ifdef __LP64__
 int space OBJC2_UNAVAILABLE;
 #endif
 //variable length structure
struct objc_ivar ivar_list[1] OBJC2_UNAVAILABLE;
} OBJC2_UNAVAILABLE;

//objc_method_list结构体存储着objc_method的数组列表
struct objc_method_list {
    struct objc_method_list *obsolete OBJC2_UNAVAILABLE;
    int method_count OBJC2_UNAVAILABLE;
#ifdef __LP64__
    int space OBJC2_UNAVAILABLE;
#endif
    // variable length structure
    struct objc_method method_list[1] OBJC2_UNAVAILABLE;
}
 */

/*
 objc_object与id
 struct objc_object {
 Class isa OBJC_ISA_AVAILABILITY;
 };
 typedef struct objc_object *id;
 */

/*
 struct objc_cache {
 unsigned int mask//指定分配缓存bucket的总数。runtime使用这个字段确定线性查找数组的索引位置 total = mask + 1
unsigned int occupied OBJC2_UNAVAILABLE; //实际占用缓存bucket总数
Method buckets[1] OBJC2_UNAVAILABLE; //指向Method数据结构指针的数组，这个数组的总数不能超过mask+1，但是指针是可能为空的，这就表示缓存bucket没有被占用，数组会随着时间增长。
};
 */

//typedef struct objc_class *Class;
//typedef struct objc_object *id;

//类本质上也是对象，我们称之为类对象 .实例方法是保存在类中的，而类方法是保存在元类中的.元类也是对象,是根元类的对象。根元类也是元类，所以它所属的类也是根元类，即它本身
/*
 typedef struct category_t {
 const char *name;  //类的名字
 classref_t cls;  //类
 struct method_list_t *instanceMethods;  //category中所有给类添加的实例方法的列表
 struct method_list_t *classMethods;  //category中所有添加的类方法的列表
 struct protocol_list_t *protocols;  //category实现的所有协议的列表
 struct property_list_t *instanceProperties;  //category中添加的所有属性
 } category_t;
 */


@implementation BYFoundationTestViewController

- (void)loadTableList{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ObjectiveC_Foundation" ofType:@"plist"];
    self.datas = [[NSArray alloc] initWithContentsOfFile:path];
}

- (void)by_viewDidLoad{
    self.title = @"Foundation框架";
}


// 只要程序启动就会将所有类的代码加载到内存中, 放到代码区
// load方法会在当前类被加载到内存的时候调用, 有且仅会调用一次
// 如果存在继承关系, 会先调用父类的load方法, 再调用子类的load方法
+ (void)load
{
}

// 当当前类第一次被使用的时候就会调用(创建类对象的时候)
// initialize方法在整个程序的运行过程中只会被调用一次, 无论你使用多少次这个类都只会调用一次
// initialize用于对某一个类进行一次性的初始化
// initialize和load一样, 如果存在继承关系, 会先调用父类的initialize再调用子类的initialize
+ (void)initialize
{
}

@end
