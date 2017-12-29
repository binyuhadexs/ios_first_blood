//
//  BYAdapterDemoViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/12/11.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYAdapterDemoViewController.h"
#import "ColorView.h"
#import "ColorViewAdapter.h"
#import "NewVCModel.h"

/*
 适配器模式
 意图：将一个类的接口转换成客户希望的另外一个接口。适配器模式使得原本由于接口不兼容而不能一起工作的那些类可以一起工作。
 优点： 1、可以让任何两个没有关联的类一起运行。 2、提高了类的复用。 3、增加了类的透明度。 4、灵活性好。
 缺点： 1、过多地使用适配器，会让系统非常零乱，不易整体进行把握。比如，明明看到调用的是 A 接口，其实内部被适配成了 B 接口的实现，一个系统如果太多出现这种情况，无异于一场灾难。因此如果不是很有必要，可以不使用适配器，而是直接对系统进行重构。
 
 对象适配器：适配者和适配器是一个关联关系，相当于应用一个类
 类适配器： 通过类的继承来适配接口     违反迪米特原则
 
 
 */

@interface BYAdapterDemoViewController ()

@property (nonatomic,weak) ColorView *colorView;

@end

@implementation BYAdapterDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //TODO
    
    ColorView *colorView = [[ColorView alloc] initWithFrame:self.view.bounds];
    self.colorView = colorView;
    
    // 赋值模型
    NewVCModel *model = [[NewVCModel alloc] init];
    model.smallViewColor = @"blue";
    model.userName = @"李四";
    model.password = @"!123456789!";
    
    ColorViewAdapter *adapter = [[ColorViewAdapter alloc] initWithModel:model];
    [colorView loadModel:adapter];
    
    // 添加
    [self.view addSubview:colorView];
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 赋值模型
    NewVCModel *model = [[NewVCModel alloc] init];
    model.smallViewColor = @"yellow";
    model.userName = @"李四2";
    model.password = @"1234";
    ColorViewAdapter *adapter = [[ColorViewAdapter alloc] initWithModel:model];
    [self.colorView loadModel:adapter];
}



@end
