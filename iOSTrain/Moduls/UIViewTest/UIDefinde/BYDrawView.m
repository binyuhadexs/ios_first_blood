//
//  BYDrawView.m
//  iOSTrain
//
//  Created by binyu on 2017/11/22.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYDrawView.h"

@implementation BYDrawView

/*
 drawRect方法什么时候调用
UIBezierPath  http://www.jianshu.com/p/6130b51a0b71
 
 */
- (void)drawRect:(CGRect)rect {
    //无论有没有看到上下文.只要在View上面绘图,就必须在drawRect方法.
//    [self drawDemoRect:rect];
    
//    [self drawrect];
//    [self drawrect:rect];
//    [self drawText];
//    [self drawImageRect:rect];
    
//    [self drawContextDemoRect:rect];
    [self drawCGContexDemo2Rect:rect];
}

//上下文的矩阵操作
- (void)drawCGContexDemo2Rect:(CGRect)rect {
    //1.获得跟View相关联的上下文
    CGContextRef ctx =  UIGraphicsGetCurrentContext();
    //2.描述路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-100, -50, 200, 100)];
    [[UIColor redColor] set];
    
    //上下文的矩阵操作,必须得要在添加路径之前做操作.
    //平移
    CGContextTranslateCTM(ctx, 100, 50);
    //缩放
    CGContextScaleCTM(ctx, 0.5, 0.5);
    //旋转
    CGContextRotateCTM(ctx, M_PI_4);
    //3.把路径 添加到当前上下文
    CGContextAddPath(ctx, path.CGPath);
    //4.把上下文的内容渲染出来.
    CGContextFillPath(ctx);
}

- (void)drawContextDemoRect:(CGRect)rect {
    //1.获取跟View相关联的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.描述路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //添加横线
    [path moveToPoint:CGPointMake(10, 150)];
    [path addLineToPoint:CGPointMake(290, 150)];
    
    //把当前的状态保存到图片上下文状态栈里.
    CGContextSaveGState(ctx);
    
    
    [[UIColor redColor] set];
    CGContextSetLineWidth(ctx, 10);
    
    
    //3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    //4.把上下文的内容渲染出来.
    CGContextStrokePath(ctx);
    
    path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(150, 10)];
    [path addLineToPoint:CGPointMake(150, 290)];
    
    
    //恢复上下文状态栈
    CGContextRestoreGState(ctx);
    //3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    //4.把上下文的内容渲染出来.
    CGContextStrokePath(ctx);
    
    
}

/*
 //创建CADisplayLink (当每一屏幕刷新就会调用 每一秒刷新60)
 CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
 [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
 */

- (void)drawImageRect:(CGRect)rect{
    //1.加载图片
    UIImage *image = [UIImage imageNamed:@"001"];
    
    //绘制出来的图片,是保持原来图片
//            [image drawAtPoint:CGPointZero];
    //把图片填充到这个rect当中.
//            [image drawInRect:rect];
    //添加裁剪区域 .把超区裁剪区域以外都裁剪掉
        UIRectClip(CGRectMake(0, 0, 50, 50));
        [image drawAsPatternInRect:self.bounds];
}

- (void)drawText{
    NSString *str = @"好好学习天天向上，好好学习天天向上";
    
    //AtPoint:文字所画的位置
    //withAttributes:描述文字的属性.
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //设置文字大小
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:50];
    
    //设置文字颜色
    dict[NSForegroundColorAttributeName] = [UIColor greenColor];
    //设置描边宽度
    dict[NSStrokeWidthAttributeName] = @2;
    //设置描边颜色
    dict[NSStrokeColorAttributeName] = [UIColor blueColor];
    
    
    //设置阴影
    NSShadow *shadow = [[NSShadow alloc] init];
    //设置阴影的便宜量
    shadow.shadowOffset = CGSizeMake(10, 10);
    //设置阴影颜色
    shadow.shadowColor = [UIColor greenColor];
    //设置阴影模糊程序
    shadow.shadowBlurRadius = 1;
    dict[NSShadowAttributeName] = shadow;
    //不会自动换行
    [str drawAtPoint:CGPointZero withAttributes:dict];
    //会自动换行.
    [str drawInRect:self.bounds withAttributes:dict];
}

- (void)drawrect:(CGRect)rect{
    NSArray *dataArray =  @[@25,@25,@25,@25];
    
    //画饼图扇形
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat endA = 0;
    
    for (NSNumber *num in dataArray) {
        startA = endA;
        angle = num.intValue / 100.0 * M_PI * 2;
        endA = startA + angle;
        UIBezierPath  *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:center];
        [[self randomColor] set];
        [path fill];
    }
}

//随机生成一个颜色
- (UIColor *)randomColor{
    
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    //0-255.
    //    colorWithRed  0-1
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

//画矩形.
- (void)drawrect{
    
    //画矩形.
    //1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.描述路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 100, 100)];
    //3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    [[UIColor yellowColor] set];
    
    //4.把上下文的内容显示
    CGContextFillPath(ctx);
    
}

- (void)drawDemoRect:(CGRect)rect{
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    CGFloat startA = 0;
    CGFloat endA = -M_PI_2;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:NO];
    
    [path addLineToPoint:center];
    path.lineWidth = 5;
    
    //封闭路径
    //    [path closePath];
    
    [[UIColor blueColor] set];
    
    //fill,会自动把路径给关闭
    [path fill];
}

//- init

//代码实例化UIView的时候
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //添加UI
    }
    return self;
}

////文件加载UIView的时候，initWithCoder会执行
//- (instancetype)initWithCoder:(NSCoder *)aDecoder{
//    if (self = [super initWithCoder:aDecoder]) {
//        //添加UI
//    }
//    return self;
//}
//
////
//- (void)awakeFromNib{
//    [super awakeFromNib];
//    //TODO
//}

//TODO
- (void)layoutSubviews{
    [super layoutSubviews];
}

@end
