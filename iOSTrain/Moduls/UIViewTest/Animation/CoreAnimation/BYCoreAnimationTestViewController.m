//
//  BYCoreAnimationTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/20.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYCoreAnimationTestViewController.h"
#define angle2Rad(angle) ((angle) / 180.0 * M_PI)

@interface BYCoreAnimationTestViewController ()
@property (weak, nonatomic) IBOutlet UIView *yellow;
@property (weak, nonatomic) IBOutlet UIImageView *oneView;
@property (weak, nonatomic) IBOutlet UIImageView *twoView;
@property (weak, nonatomic) IBOutlet UIImageView *trazitionView;

@end

@implementation BYCoreAnimationTestViewController

/*
 
                     CAAnaimation  --- CAMediaTiming
 
   CAAnimationGroup CAPropertyAnimation  CATransition 转场动画
 
             CABasicAnimation CAKeyframeAnimation
 
 */

/*
UIView动画与核心动画的区别?
1.核心动画只作用在layer.
2.核心动画修改的值都是假像.它的真实位置没有发生变化.

什么时候用UIView动画什么时候用核心动画?
当需要与用户进行交互时用UIView,不需要与用户进行交互时两个都可以.

什么情况用核心动画最多?
1.转场动画.
2.帧动画.
3.动画组.



*/

/*
 https://zsisme.gitbooks.io/ios-/content/chapter1/the-layer-tree.html
 http://www.imlifengfeng.com/blog/?p=548
 QuartzCore

 
 CALayer
 一个视图默认只有一个相关联的图层；支持添加多个图层；处理视图比处理图层要更加方便。
 
 */

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self CAKeyframeAnimationDemo1];
//    [self CATransitionDemo1];
    [self CAAnimationGroupDemo1];
    
}

- (void)addLayer{
    
}

#pragma mark CABasicAnimation
- (void)CABasicAnimationDemo{
    //TODO
    //1.创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    //2.核心动画的本质就是修改属性值.
    //    anim.keyPath = @"transform.scale";
    anim.keyPath = @"position";
    //3.设置属性值
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 400)];
    
    //4.动画完成时, 不要删除动画
    anim.removedOnCompletion = NO;
    //5.保存动画最前面效果
    anim.fillMode = kCAFillModeForwards;
    
    //添加动画
    [self.yellow.layer addAnimation:anim forKey:nil];
}

- (void)CABasicAnimationDemo1{
    //创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    //设置属性
    anim.keyPath = @"transform.scale";
    //设置属性值.
    anim.toValue = @0;
    //设置动画的执行次数
    anim.repeatCount = MAXFLOAT;
    //设置动画的执行时长
    anim.duration = 0.5;
    //自动反转
    anim.autoreverses = YES;
    //添加动画
    [self.yellow.layer addAnimation:anim forKey:nil];
}

#pragma mark CAKeyframeAnimation
//图标抖动
- (void)CAKeyframeAnimationDemo{
    
    //创建一个帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    //设置属性
    anim.keyPath = @"transform.rotation";
    
    //设置属性值.  按照余弦函数取 旋转点
    anim.values = @[@(angle2Rad(-3)),@(angle2Rad(3)),@(angle2Rad(-3))];
    //设置执行的次数
    anim.repeatCount = MAXFLOAT;
    anim.duration = 0.4;
    //添加动画
    [self.oneView.layer addAnimation:anim forKey:nil];
    [self.twoView.layer addAnimation:anim forKey:nil];
    
}
- (void)CAKeyframeAnimationDemo1{
    //创建一个帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    //设置属性
    anim.keyPath = @"position";
    //    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 300, 400)];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(10, 50)];
    [path addLineToPoint:CGPointMake(300, 400)];
    anim.path = path.CGPath;
    //设置执行的次数
    anim.repeatCount = MAXFLOAT;
    
    anim.autoreverses = YES;
    
    anim.duration = 1;
    
    //添加动画
    [self.oneView.layer addAnimation:anim forKey:nil];
}

#pragma mark CATransition

static int _i = 1;
- (void)CATransitionDemo{
    //转场代码必须得要和转场动画在同一个方法当中.
    //创建动画
    CATransition *anim = [CATransition animation];
    
    //设置转场类型
    anim.type = @"pageCurl";
    
    //设置转场的方向
    anim.subtype = kCATransitionFromTop;
    //设置动画的开始点.
    anim.startProgress = 0.2;
    //设置动画的结束点.
    anim.endProgress = 0.8;
    
    anim.duration = 1;
    [self.trazitionView.layer addAnimation:anim forKey:nil];

    //转场代码

    _i++;
    if (_i > 3) {
        _i = 1;
    }
    NSString *imageName = [NSString stringWithFormat:@"transition%d",_i];
    self.trazitionView.image = [UIImage imageNamed:imageName];
}

- (void)CATransitionDemo1{
    [UIView transitionWithView:self.trazitionView duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        _i++;
        if (_i > 3) {
            _i = 1;
        }
        NSString *imageName = [NSString stringWithFormat:@"transition%d",_i];
        self.trazitionView.image = [UIImage imageNamed:imageName];
    } completion:nil];
}

#pragma mark CAAnimationGroup
- (void)CAAnimationGroupDemo1{
    CAAnimationGroup *group = [CAAnimationGroup animation];
    //缩放
    CABasicAnimation *scaleAnim = [CABasicAnimation animation];
    //设置属性
    scaleAnim.keyPath = @"transform.scale";
    scaleAnim.toValue = @0.5;
    
    //平移
    CABasicAnimation *Anim = [CABasicAnimation animation];
    //设置属性
    Anim.keyPath = @"position.y";
    Anim.toValue = @(400);
    group.animations = @[scaleAnim,Anim];
    group.removedOnCompletion = NO;
    group.fillMode  = kCAFillModeForwards;
    //添加动画
    [self.yellow.layer addAnimation:group forKey:nil];
}
- (IBAction)test:(id)sender {
    NSLog(@"test-----");
}

@end
