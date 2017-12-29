//
//  BYPrototypeDemoViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYPrototypeDemoViewController.h"
#import "StudentModel.h"
#import "ClassModel.h"

/*
 原型模式
 意图：用原型实例指定创建对象的种类，并且通过拷贝这些原型创建新的对象。
 主要解决：在运行期建立和删除原型。
 何时使用： 1、当一个系统应该独立于它的产品创建，构成和表示时。 2、当要实例化的类是在运行时刻指定时，例如，通过动态装载。 3、为了避免创建一个与产品类层次平行的工厂类层次时。 4、当一个类的实例只能有几个不同状态组合中的一种时。建立相应数目的原型并克隆它们可能比每次用合适的状态手工实例化该类更方便一些。
 如何解决：利用已有的一个原型对象，快速地生成和原型对象一样的实例。
 
 应用实例： 1、细胞分裂。 2、JAVA 中的 Object clone() 方法。
 优点： 1、性能提高。 2、逃避构造函数的约束。
 缺点： 1、配备克隆方法需要对类的功能进行通盘考虑，这对于全新的类不是很难，但对于已有的类不一定很容易，特别当一个类引用不支持串行化的间接对象，或者引用含有循环结构的时候。 2、必须实现 Cloneable 接口。 3、逃避构造函数的约束。

 
 
 */

@interface BYPrototypeDemoViewController ()

@end

@implementation BYPrototypeDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    StudentModel *stu1 = [StudentModel new];
    stu1.name = @"张三";
    
    StudentModel *stu2 = stu1.copy;
    
    // classModel
    ClassModel *class1 = [[ClassModel alloc] init];
    class1.className = @"ban ji 1";
    class1.students = @[stu1, stu2];
    
    ClassModel *class2 = class1.copy;
    
    NSLog(@"%@ ----%@", class1, class2);
    NSLog(@"%@", class1.students);
    NSLog(@"%@", class2.students);
}



@end
