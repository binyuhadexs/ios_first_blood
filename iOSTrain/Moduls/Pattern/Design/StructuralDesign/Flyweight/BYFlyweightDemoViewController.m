//
//  BYFlyweightDemoViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/12/6.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYFlyweightDemoViewController.h"
#import "FlyweightFactory.h"

/*
 享元模式
 意图：运用共享技术有效地支持大量细粒度的对象。
 主要解决：在有大量对象时，有可能会造成内存溢出，我们把其中共同的部分抽象出来，如果有相同的业务请求，直接返回在内存中已有的对象，避免重新创建。
 如何解决：用唯一标识码判断，如果在内存中有，则返回这个唯一标识码所标识的对象。
 
 内部状态外部状态
 
 
 */
@interface BYFlyweightDemoViewController ()

@property(nonatomic,strong)FlyweightFactory *factory;

@end

@implementation BYFlyweightDemoViewController

- (void)viewDidLoad {
   [super viewDidLoad];
    self.factory =  [[FlyweightFactory alloc] init];
    FlyweightView *view =  [_factory viewWithIdentify:@"123"];
    view.backgroundColor = [UIColor redColor];
    NSLog(@"view=%p",view);
    [self.view addSubview:view];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    FlyweightView *view =  [_factory viewWithIdentify:@"123"];
    view.backgroundColor = [UIColor grayColor];
    NSLog(@"view=%p",view);
    [self.view addSubview:view];
    
//    FlyweightView *view2 =  [_factory viewWithIdentify:@"1234"];
//    view2.backgroundColor = [UIColor blueColor];
//    NSLog(@"view=%p",view2);
//    [self.view addSubview:view2];
}



@end
