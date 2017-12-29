//
//  BridgePatternDemoViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/12/6.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BridgePatternDemoViewController.h"
#import "HandsetBrandN.h"
#import "HandsetBrandM.h"
#import "HandsetGameSoft.h"
#import "HandsetAdressListSoft.h"

#import "SubRemote.h"
#import "TVKJ.h"
#import "TVXiaoMI.h"

/*
 桥接模式
 意图：将抽象部分与实现部分分离，使它们都可以独立的变化。 -- 抽象类和和它的派生类来实现自己的功能
 主要解决：在有多种可能会变化的情况下，用继承会造成类爆炸问题，扩展起来不灵活。
 
 合成/复合原则
 
 例子 参考大话设计模式
 http://www.runoob.com/design-pattern/bridge-pattern.html
 
 暴露更多的细节给客户端
 
 */
@interface BridgePatternDemoViewController ()

@end

@implementation BridgePatternDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self demo1];
    [self demo3];

}

- (void)demo3{
    // 遥控器调用康佳电视
    SubRemote *subremote = [[SubRemote alloc] init];
    subremote.tv = [[TVKJ alloc] init];
    [subremote up];
    
    // 遥控器来调用小米
    subremote.tv = [[TVXiaoMI alloc] init];
    [subremote up];
    [subremote down];
}

- (void)demo1{
    HandsetBrandN *brand  = [[HandsetBrandN alloc] init];
    brand.soft = [[HandsetGameSoft alloc] init];
    [brand run];
    brand.soft = [[HandsetAdressListSoft alloc] init];
    [brand run];
    
    
    HandsetBrandM *brandM = [[HandsetBrandM alloc] init];
    brandM.soft = [[HandsetGameSoft alloc] init];
    [brandM run];
    brandM.soft = [[HandsetAdressListSoft alloc] init];
    [brandM run];
}




@end
