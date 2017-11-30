//
//  BYTableViewTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/22.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYTableViewTestViewController.h"

@interface BYTableViewTestViewController ()<UITableViewDelegate,UITableViewDataSource,UITableViewDataSourcePrefetching>

@end

/*
 TableView优化
 正确使用 reuseIdentifier 来重用 Cells
 Cell 中的子视图都要使用背景颜色，并且不要设置颜色的 alpha 值
 尽量少用或不用透明图层
 尽量减少 subviews 的数量
 尽量少用 addSubview 给 Cell 动态添加 View，可以初始化时就添加，然后通过 hidden 来控制是否显示
 Cell 显示模型数据最好提前计算完成，避免在渲染时动态计算
 在 heightForRowAtIndexPath: 中尽量不使用 cellForRowAtIndexPath:
 
 提前计算并缓存好高度，因为 heightForRowAtIndexPath: 是调用最频繁的方法，一定不要使用自动计算行高！
 滑动时按需加载，这个在大量图片展示，网络加载的时候很管用，目前的第三方图片框架都已经处理的很好
 按需加载，还可以在 override func scrollViewWillEndDragging:withVelocity :targetContentOffset:) 方法中根据力量以及目标位置预先加载数据
 异步绘制，遇到复杂界面，遇到性能瓶颈时，可能就是突破口，代码的复杂度高，相当于自己还要做缓存，可以使用 ASDisplayKit；
 
 http://blog.sunnyxx.com/2015/05/17/cell-height-calculation/
 */



@implementation BYTableViewTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UITableView
    
}



@end
