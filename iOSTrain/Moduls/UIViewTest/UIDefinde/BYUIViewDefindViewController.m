//
//  BYUIViewDefindViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/22.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYUIViewDefindViewController.h"
#import "BYCodeTestView.h"
#import "BYXibTestView.h"
#import "BYDrawView.h"

@interface BYUIViewDefindViewController ()

@end

/*
 自定义控件方式
 0、修改或扩展系统控件
 1、组合控件
     a、代码实现
     b、xib实现
 2、drawRect定义
     UIBezierPath
     UIKit绘图API
     CGContextRef
 
 */

/*
 UIView生命周期
 
 
 */

/*
Controller生命周期
 
 
 */

@implementation BYUIViewDefindViewController

//
//- (void)loadView{
//
//}

/*
 drawRect在以下情况下会被调用：
 
 1、如果在UIView初始化时没有设置rect大小，将直接导致drawRect不被自动调用。drawRect 掉用是在Controller->loadView, Controller->viewDidLoad 两方法之后掉用的.所以不用担心在 控制器中,这些View的drawRect就开始画了.这样可以在控制器中设置一些值给View(如果这些View draw的时候需要用到某些变量 值).
 2、该方法在调用sizeToFit后被调用，所以可以先调用sizeToFit计算出size。然后系统自动调用drawRect:方法。
 3、通过设置contentMode属性值为UIViewContentModeRedraw。那么将在每次设置或更改frame的时候自动调用drawRect:。
 4、直接调用setNeedsDisplay，或者setNeedsDisplayInRect:触发drawRect:，但是有个前提条件是rect不能为0。
 */

/*
 layoutSubviews在以下情况下会被调用：
 
 1、init初始化不会触发layoutSubviews。
 2、addSubview会触发layoutSubviews。
 3、设置view的Frame会触发layoutSubviews，当然前提是frame的值设置前后发生了变化。
 4、滚动一个UIScrollView会触发layoutSubviews。
 5、旋转Screen会触发父UIView上的layoutSubviews事件。
 6、改变一个UIView大小的时候也会触发父UIView上的layoutSubviews事件。
 7、直接调用setLayoutSubviews。
 
 */

/*
 drawRect方法使用注意点：
 
 1、 若使用UIView绘图，只能在drawRect：方法中获取相应的contextRef并绘图。如果在其他方法中获取将获取到一个invalidate 的ref并且不能用于画图。drawRect：方法不能手动显示调用，必须通过调用setNeedsDisplay 或 者 setNeedsDisplayInRect，让系统自动调该方法。
 2、若使用calayer绘图，只能在drawInContext: 中（类似鱼drawRect）绘制，或者在delegate中的相应方法绘制。同样也是调用setNeedDisplay等间接调用以上方法
 3、若要实时画图，不能使用gestureRecognizer，只能使用touchbegan等方法来掉用setNeedsDisplay实时刷新屏幕
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //
//    [self demo1];
//    [self demo2];
//    [self addWatermark];
    [self clipDemo];
}

//代码组合系统控件

- (void)demo1{
    BYCodeTestView *view = [[BYCodeTestView alloc] initWithFrame:CGRectMake(0, 64, 300, 300)];
    [self.view addSubview:view];
}

- (void)demo2{
    BYXibTestView *view = [[BYXibTestView alloc] initWithFrame:CGRectMake(0, 64, 300, 300)];
    [self.view addSubview:view];
}

- (void)demo3{
    BYDrawView *view = [[BYDrawView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self.view addSubview:view];
}

//添加水印
- (void)addWatermark{
    UIImage *image = [UIImage imageNamed:@"002"];
    
    //生成图片.
    //size:开开启一个多大图片上下文.
    //opaque:不透度
    //scale:0
    //开启跟图片相同的大小上下文.
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    //把图片给绘制图片上下文.
    [image drawAtPoint:CGPointZero];
    //绘制文字
    NSString *str = @"夏彬毓";
    [str drawAtPoint:CGPointZero withAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10]}];
    //生成图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //手动关闭上下文
    UIGraphicsEndImageContext();
    UIImageView *imageview = [[UIImageView alloc] initWithImage:newImage];
    [self.view addSubview:imageview];
}

- (void)clipDemo{
    //1.加载图片
    UIImage *image = [UIImage imageNamed:@"002"];
    //2.生成一个跟图片相同大小图片上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //3.在上下文添加一个圆形裁剪区域
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    //把路径设置成裁剪区域
    [path addClip];
    
    //4.把图片绘制图片上下文.
    [image drawAtPoint:CGPointZero];
    
    //5.生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //6.关闭图片上下文.
    UIGraphicsEndImageContext();
    UIImageView *imageview = [[UIImageView alloc] initWithImage:newImage];
    [self.view addSubview:imageview];
}

//带边框的剪裁
+ (UIImage *)imageWithBorderWidth:(CGFloat)borderW borderColor:(UIColor *)color image:(UIImage *)image{
    //3.开启图片上下文.
    CGSize size = CGSizeMake(image.size.width + 2 * borderW, image.size.height + 2 * borderW);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    //4.先描述一个大圆,设为填充
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    //设置边框的颜色
    [color set];
    [path fill];
    //5.再添加一个小圆,把小圆设裁剪区域
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    [path addClip];
    //6.把图片给绘制上下文.
    [image drawInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    //7.生成一张新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //8.关闭上下文.
    UIGraphicsEndImageContext();
    return newImage;
}

//截屏
- (void)abc{
    //1.开启图片上下文.
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    //获取当前的上下文.
    CGContextRef ctx =  UIGraphicsGetCurrentContext();
    //UIView之所能够显示,是因为它内部有一个层,layer.层是通过渲染的方法,给绘制上下文.
    [self.view.layer renderInContext:ctx];
    //生成一张图片.
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //如何把图片转换成二进流.
    NSData *data = UIImagePNGRepresentation(newImage);
    //获取沙盒目录
//    [data writeToFile:@"...../xxx.png" atomically:YES];
    //关闭上下文.
    UIGraphicsEndImageContext();
}


@end
