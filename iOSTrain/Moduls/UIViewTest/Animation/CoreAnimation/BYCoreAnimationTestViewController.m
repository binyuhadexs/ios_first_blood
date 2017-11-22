//
//  BYCoreAnimationTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/20.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYCoreAnimationTestViewController.h"

@interface BYCoreAnimationTestViewController ()
@property (weak, nonatomic) IBOutlet UIView *yellow;

@end

@implementation BYCoreAnimationTestViewController

/*
 https://zsisme.gitbooks.io/ios-/content/chapter1/the-layer-tree.html
 http://www.imlifengfeng.com/blog/?p=548
 QuartzCore
 
 CAAnaimation
 
 CALayer
 一个视图默认只有一个相关联的图层；支持添加多个图层；处理视图比处理图层要更加方便。
 
 */

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self addLayer];
}

- (void)addLayer{
    
    
    CALayer *sublayer = [CALayer layer];
    sublayer.frame = CGRectMake(0, 0, 100, 100);
    sublayer.backgroundColor = [UIColor greenColor].CGColor;
   
    //contents 寄宿图，如果赋值不是CGImage,图层将是空白；id类型的原因，CGImage，NSImage起作用；
    sublayer.contents =(__bridge id)[UIImage imageNamed:@"tabbar_router_focus"].CGImage;
    
    //contentMode 对应 contentsGravity
//    self.yellow.contentMode = UIViewContentModeScaleAspectFit
//    sublayer.contentsGravity =kCAGravityCenter;
   /*
    kCAGravityCenter
    kCAGravityTop
    kCAGravityBottom
    kCAGravityLeft
    kCAGravityRight
    kCAGravityTopLeft
    kCAGravityTopRight
    kCAGravityBottomLeft
    kCAGravityBottomRight
    kCAGravityResize
    kCAGravityResizeAspect
    kCAGravityResizeAspectFill
    */
    
    //像素尺寸和视图大小的比例 默认1.0 --和contentsGravity冲突
//    self.yellow.contentScaleFactor 对应功能
//    sublayer.contentsScale = [UIScreen mainScreen].scale;//3.0; //每个点两个像素绘制图片  支持高分辨率屏幕机制的一部分
//    self.yellow.clipsToBounds 决定是否绘制超出部分的内容
//    sublayer.masksToBounds = YES;
    
    //显示图层的区域    单位坐标
//    sublayer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
    //
    
    [self.yellow.layer addSublayer:sublayer];
}

@end
