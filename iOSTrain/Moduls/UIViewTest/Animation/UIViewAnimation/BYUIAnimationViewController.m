//
//  UIAnimationViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/20.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYUIAnimationViewController.h"

@interface BYUIAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *grayView;

@end
/*
 http://www.jianshu.com/p/5abc038e4d94
 UIView动画实质上是对Core Animation的封装，提供简洁的动画接口。
 
 UIView动画可以设置的动画属性有:
 1、大小变化(frame)
 2、拉伸变化(bounds)
 3、中心位置(center)
 4、旋转(transform)
 5、透明度(alpha)
 6、背景颜色(backgroundColor)
 7、拉伸内容(contentStretch)
 
 
 */

//
CGAffineTransform CGAffineTransformMakeDemo(CGFloat x,CGFloat y){
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform.c= -x;
    transform.b= y;
    return transform;
}

@implementation BYUIAnimationViewController

- (void)viewDidLoad{
    self.title = @"UIView动画";
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    [self frameAnimation];
//    [self blockAnimationDemo];
//    [self SpringAnimationDemo];
//    [self KeyframesAnimationDemo];
//    [self KeyframesAnimationDemo2];
    
    [self transitionAnimationDemo1];
//    [self transitionAnimationDemo2];
}
- (IBAction)gogogoClick:(id)sender {
    NSLog(@"GOGOGO");
}


- (void)frameAnimation{
    //
    [UIView beginAnimations:@"FrameAni" context:nil];
    [UIView setAnimationDuration:1.0]; // //动画持续时间
    [UIView setAnimationDelegate:self];//动画的代理对象
    [UIView setAnimationWillStartSelector:@selector(startAni:)]; //设置动画将开始时代理对象执行的SEL
    [UIView setAnimationDidStopSelector:@selector(stopAni:)]; //设置动画结束时代理对象执行的SEL
    [UIView setAnimationDelay:0];//设置动画延迟执行的时间
    [UIView setAnimationRepeatCount:1];//设置动画的重复次数
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];////设置动画的曲线
    /*
     UIViewAnimationCurveEaseInOut,         // 慢进慢出（默认值）
     UIViewAnimationCurveEaseIn,            // 慢进
     UIViewAnimationCurveEaseOut,           // 慢出
     UIViewAnimationCurveLinear             // 匀速
     */
    [UIView setAnimationBeginsFromCurrentState:YES];//设置是否从当前状态开始播放动画
    /*
    假设上一个动画正在播放，且尚未播放完毕，我们将要进行一个新的动画：
    当为YES时：动画将从上一个动画所在的状态开始播放
    当为NO时：动画将从上一个动画所指定的最终状态开始播放（此时上一个动画马上结束）*/
    
//    [UIView setAnimationRepeatAutoreverses:(BOOL)]; //设置动画是否继续执行相反的动画
//    [UIView setAnimationsEnabled:NO];  //是否禁用动画效果（对象属性依然会被改变，只是没有动画效果）
    
    
//    self.blueView.frame = self.yellowView.frame;
//    self.blueView.bounds = self.yellowView.bounds;
//     self.blueView.center = self.yellowView.center;
//    self.blueView.backgroundColor = [UIColor grayColor];
//    self.blueView.alpha = 0.5;
    //
    
    //仿射 http://www.jianshu.com/p/6c09d138b31d
    //根据本身的transform进行平移
//    self.blueView.transform = CGAffineTransformMakeTranslation(self.blueView.transform.tx +20, self.blueView.transform.ty +20);
    //根据本身的transform后者另外的transform进行平移
//    self.blueView.transform = CGAffineTransformTranslate(self.blueView.transform, 20, 20);
    
    //根据本身的transform进行缩放
//    self.blueView.transform  = CGAffineTransformMakeScale(0.8,0.8);
//     self.blueView.transform  = CGAffineTransformScale(self.blueView.transform,1.0,1.0);
    
    //根据本身的transform进行旋转
//    self.blueView.transform  =   CGAffineTransformMakeRotation(1.5);//M_PI*0.5
    //根据本身的transform后者另外的transform进行旋转
//     self.blueView.transform  = CGAffineTransformRotate(self.blueView.transform,1.8);
    //恢复原状
//    CGAffineTransformInvert(self.blueView.transform);

    
    
    //合并：两个transform合并起来
//   self.blueView.transform  =  CGAffineTransformConcat(CGAffineTransformTranslate(self.blueView.transform, 20, 20), CGAffineTransformScale(self.blueView.transform,0.5,0.5));
    //仿射矩阵应用：
    
    //x按照a值进行了比例缩放，y按照d的值进行比列缩放
    //x会跟着c的值进行拉伸(View的宽度是跟着改变)，y会跟着b的值进行拉伸（View的高度跟着改变）
    //x会跟着t.x进行x做表平移，y会跟着t.y进行平移  abcd共同控制旋转
//    self.blueView.transform = CGAffineTransformMake(0.5, 0, 0, 0.5, 20, 20);
    
    //自定义Transform
//    self.blueView.transform = CGAffineTransformMakeDemo(2.0,1.0);
    
    //转场效果动画
     [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.blueView cache:YES];
    
    /*
     UIViewAnimationTransitionNone,              //不使用动画
     UIViewAnimationTransitionFlipFromLeft,      //从左向右旋转翻页
     UIViewAnimationTransitionFlipFromRight,     //从右向左旋转翻页
     UIViewAnimationTransitionCurlUp,            //从下往上卷曲翻页
     UIViewAnimationTransitionCurlDown,          //从上往下卷曲翻页
     */
    
    //废弃
//    self.blueView.contentStretch = CGRectMake( self.blueView.frame.origin.x, self.blueView.frame.origin.x, self.blueView.frame.size.width *2, self.blueView.frame.size.height *2);
    [UIView commitAnimations];
    
}


//Block动画方法
- (void)blockAnimationDemo{
//    iOS4.0以后，增加了Block动画块，提供更简洁的方式来实现动画。
    
    [UIView animateWithDuration:1.0 animations:^{
            self.blueView.frame = self.yellowView.frame;
        //    self.blueView.bounds = self.yellowView.bounds;
        //     self.blueView.center = self.yellowView.center;
        //    self.blueView.backgroundColor = [UIColor grayColor];
            self.blueView.alpha = 0.5;
//         self.blueView.transform = CGAffineTransformMakeDemo(2.0,1.0);
    }];
    
//    [UIView animateWithDuration:1.0 animations:^{
//
//    } completion:^(BOOL finished) {
//
//    }];
    
    
    
}

- (void)blockAnimationDemo2{
    //动画的过渡效果 options可组合使用：
    [UIView animateWithDuration:1.0 delay:0.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
    
    /*
     UIViewAnimationOptionLayoutSubviews            //进行动画时布局子控件
     UIViewAnimationOptionAllowUserInteraction      //进行动画时允许用户交互
     UIViewAnimationOptionBeginFromCurrentState     //从当前状态开始动画
     UIViewAnimationOptionRepeat                    //无限重复执行动画
     UIViewAnimationOptionAutoreverse               //执行动画回路
     UIViewAnimationOptionOverrideInheritedDuration //忽略嵌套动画的执行时间设置
     UIViewAnimationOptionOverrideInheritedCurve    //忽略嵌套动画的曲线设置
     UIViewAnimationOptionAllowAnimatedContent      //转场：进行动画时重绘视图
     UIViewAnimationOptionShowHideTransitionViews   //转场：移除（添加和移除图层的）动画效果
     UIViewAnimationOptionOverrideInheritedOptions  //不继承父动画设置
     
     UIViewAnimationOptionCurveEaseInOut            //时间曲线，慢进慢出（默认值）
     UIViewAnimationOptionCurveEaseIn               //时间曲线，慢进
     UIViewAnimationOptionCurveEaseOut              //时间曲线，慢出
     UIViewAnimationOptionCurveLinear               //时间曲线，匀速
     
     UIViewAnimationOptionTransitionNone            //转场，不使用动画
     UIViewAnimationOptionTransitionFlipFromLeft    //转场，从左向右旋转翻页
     UIViewAnimationOptionTransitionFlipFromRight   //转场，从右向左旋转翻页
     UIViewAnimationOptionTransitionCurlUp          //转场，下往上卷曲翻页
     UIViewAnimationOptionTransitionCurlDown        //转场，从上往下卷曲翻页
     UIViewAnimationOptionTransitionCrossDissolve   //转场，交叉消失和出现
     UIViewAnimationOptionTransitionFlipFromTop     //转场，从上向下旋转翻页
     UIViewAnimationOptionTransitionFlipFromBottom  //转场，从下向上旋转翻页
     */
}


//Spring动画 iOS7.0后新增Spring动画
- (void)SpringAnimationDemo{
    [UIView animateWithDuration:1.0    //动画持续时间
                          delay:0.1   //动画延迟执行的时间
         usingSpringWithDamping:0.6  //震动效果，范围0~1，数值越小震动效果越明显
          initialSpringVelocity:0.8     //初始速度，数值越大初始速度越快
                        options:UIViewAnimationOptionTransitionFlipFromRight//动画的过渡效果
                     animations:^{
                         //执行的动画
                         self.blueView.frame = self.yellowView.frame;
                         //    self.blueView.bounds = self.yellowView.bounds;
                         //     self.blueView.center = self.yellowView.center;
                         //    self.blueView.backgroundColor = [UIColor grayColor];
                         self.blueView.alpha = 0.5;
                     }
                     completion:^(BOOL finished) {
                         //动画执行完毕后的操作
                     }];
    

}
//5、Keyframes动画
//iOS7.0后新增关键帧动画，支持属性关键帧，不支持路径关键帧
- (void)KeyframesAnimationDemo{
    //options可组合使用：
    [UIView animateKeyframesWithDuration:1.0 delay:0.2 options:UIViewAnimationOptionRepeat
     |UIViewKeyframeAnimationOptionCalculationModeCubicPaced
                              animations:^{
                                  self.blueView.frame = self.yellowView.frame;
                                  self.blueView.alpha = 0.5;
                              } completion:^(BOOL finished) {
                                  
                              }];
    /*
     UIViewAnimationOptionLayoutSubviews           //进行动画时布局子控件
     UIViewAnimationOptionAllowUserInteraction     //进行动画时允许用户交互
     UIViewAnimationOptionBeginFromCurrentState    //从当前状态开始动画
     UIViewAnimationOptionRepeat                   //无限重复执行动画
     UIViewAnimationOptionAutoreverse              //执行动画回路
     UIViewAnimationOptionOverrideInheritedDuration //忽略嵌套动画的执行时间设置
     UIViewAnimationOptionOverrideInheritedOptions //不继承父动画设置
     
     UIViewKeyframeAnimationOptionCalculationModeLinear     //运算模式 :连续
     UIViewKeyframeAnimationOptionCalculationModeDiscrete   //运算模式 :离散
     UIViewKeyframeAnimationOptionCalculationModePaced      //运算模式 :均匀执行
     UIViewKeyframeAnimationOptionCalculationModeCubic      //运算模式 :平滑
     UIViewKeyframeAnimationOptionCalculationModeCubicPaced //运算模式 :平滑均匀
     */

}

//
- (void)KeyframesAnimationDemo2{
    [UIView animateKeyframesWithDuration:9.0 delay:0.f options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.f relativeDuration:1.0 / 4 animations:^{
            self.blueView.backgroundColor = [UIColor colorWithRed:0.9475 green:0.1921 blue:0.1746 alpha:1.0];
        }];
        [UIView addKeyframeWithRelativeStartTime:1.0 / 4 relativeDuration:1.0 / 4 animations:^{
            self.blueView.backgroundColor = [UIColor colorWithRed:0.1064 green:0.6052 blue:0.0334 alpha:1.0];
        }];
        [UIView addKeyframeWithRelativeStartTime:2.0 / 4 relativeDuration:1.0 / 4 animations:^{
            self.blueView.backgroundColor = [UIColor colorWithRed:0.1366 green:0.3017 blue:0.8411 alpha:1.0];
        }];
        [UIView addKeyframeWithRelativeStartTime:3.0 / 4 relativeDuration:1.0 / 4 animations:^{
            self.blueView.backgroundColor = [UIColor colorWithRed:0.619 green:0.037 blue:0.6719 alpha:1.0];
        }];
    } completion:^(BOOL finished) {
        NSLog(@"动画结束");
    }];
}


//6、转场动画
//6.1 从旧视图转到新视图的动画效果
-(void)transitionAnimationDemo1{
    UIImageView * newCenterShow = [[UIImageView alloc]initWithFrame:self.grayView.frame];
    newCenterShow.backgroundColor = [UIColor orangeColor];
    [UIView transitionFromView:self.grayView toView:newCenterShow duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
        NSLog(@"动画结束");
    }];
}


//单个视图的过渡效果
-(void)transitionAnimationDemo2{
    [UIView transitionWithView: self.blueView
                      duration:1.0
                       options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        //执行的动画
                        self.blueView.frame = self.yellowView.frame;
                        self.blueView.alpha = 0.5;
                    }
                    completion:^(BOOL finished) {
                        //动画执行完毕后的操作
                    }];
}

- (void)startAni:(NSString *)aniID {
    NSLog(@"%@ start",aniID);
}

- (void)stopAni:(NSString *)aniID {
    NSLog(@"%@ stop",aniID);
}

@end
