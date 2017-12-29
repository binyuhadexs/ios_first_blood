//
//  BYDecoratorDemoViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/12/25.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYDecoratorDemoViewController.h"
#import "BlindMonk.h"
#import "Skill_Q.h"
#import "Skill_W.h"

/*
 意图：动态地给一个对象添加一些额外的职责。就增加功能来说，装饰器模式相比生成子类更为灵活。
 
 主要解决：一般的，我们为了扩展一个类经常使用继承方式实现，由于继承为类引入静态特征，并且随着扩展功能的增多，子类会很膨胀。
 何时使用：在不想增加很多子类的情况下扩展类。
 如何解决：将具体功能职责划分，同时继承装饰者模式。
 关键代码： 1、Component 类充当抽象角色，不应该具体实现。 2、修饰类引用和继承 Component 类，具体扩展类重写父类方法。
 优点：装饰类和被装饰类可以独立发展，不会相互耦合，装饰模式是继承的一个替代模式，装饰模式可以动态扩展一个实现类的功能。
 缺点：多层装饰比较复杂。
 
 */
@interface BYDecoratorDemoViewController ()

@end

@implementation BYDecoratorDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //TODO
    Hero *hero = [[BlindMonk alloc] initWithName:@"张三"];
    Skill_Q *ski = [[Skill_Q alloc] initWithHero:hero skillName:@"技能Q"];
    Skill_W *skiw =  [[Skill_W alloc] initWithHero:ski skillName:@"技能W"];
    Skill_W *skiR =  [[Skill_W alloc] initWithHero:skiw skillName:@"技能R"];
    [skiR learnSkills];
}


@end
