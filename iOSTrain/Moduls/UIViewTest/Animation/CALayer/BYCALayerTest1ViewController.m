//
//  BYCALayerTest1ViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/23.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYCALayerTest1ViewController.h"
#define angle2Rad(angle) ((angle) / 180.0 * M_PI)

//每一秒旋转6度
#define perSecondA 6

//每一分旋转
#define perMinA 6

//每一小时旋转30
#define perHourA 30
//第一分时针旋转的度数
#define perMinHour 0.5

@interface BYCALayerTest1ViewController ()<CALayerDelegate>
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIImageView *clockView;
@property(nonatomic,weak)CALayer *secondL;
@property(nonatomic,weak)CALayer *minuteL;
@property(nonatomic,weak)CALayer *hourL;

@property (weak, nonatomic) CALayer *sublayer;
@property (assign, nonatomic) BOOL ok;
@end
/*
 CALayer
 CALayer功能：
 阴影、圆角、带颜色的边框
 3D变换
 非矩形范围
 透明遮罩
 多级非线性动画

 UIView和 CALayer的平行层级
 
 视图 图层树 呈现树
 呈现图层是由呈现树中的所有图层的的呈现图层所形成
 */



//显示图层的区域    单位坐标
//    sublayer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
//

/*
 CALayer的属性
 contents //图片 如果赋值不是CGImage会展示空白，为什么要用id?因为对CGImage和NSImage都起作用
 contentsGravity  //对应UIView 的contentMode属性
 contentsScale    //像素尺寸和视图大小的比例 默认1.0 --和contentsGravity冲突
 clipsToBounds    //决定是否绘制超出部分的内容
 contentsRect     //显示图层的区域    单位坐标 ,可以设置负数或者大于1的数字 会被拉伸  !!!拼合图片
 contentsCenter  //固定边框和 图片拉伸的区域
 
 */

/*
 frame bounds center/position
 frame 并不是一个清晰的属性，是根据bounds position transform计算而来
 
 postion anchorPoint ???
 
 zPosition  anchorPointZ
 三维坐标的Z轴属性
 
 containsPoint 图层是否包含此点
 hitTest  返还该点的图层
 
 */

/*
 cornerRadius 圆角曲率
 borderWidth 边框宽带
 borderColor 边框颜色
 
 阴影
 shadowColor  阴影的颜色
 shadowOffset  阴影的方向和距离  默认(0,-3),Mac OS方向相反
 shadowRadius   阴影的模糊度
 shadowOpacity  阴影的不透明度
 shadowPath   阴影的路径，阴影的计算是非常消耗资源的，shadowPath可以提升性能。
 阴影和剪裁同时使用时会收到限制，通常使用两层layer,内层做剪裁，外层做阴影
 
 图层蒙版
 mask  父图层的可见区域
 
 拉伸过滤
 minificationFilter
 magnificationFilter
 
 组透明
 opacity 透明度 alpha影响子图层
 shouldRasterize  //解决透明度合成的问题
 rasterizationScale
 
 */

/*
  访射变换
transform
  2D
  CGAffineTransform...
  3D变换
  CATransform3D...
  透视投影
 sublayerTransform  //3D变换，影响到所有子图层
 doubleSided  //图层的背面是否要被绘制
 
 固体对象
 光亮和阴影
 
 
 */

/*
 专用图层
 CAShapeLayer  //矢量图层绘制图层
 CATextLayer    //富文本
 CATransformLayer   //3D动画
 CAGradientLayer  //颜色渐变
 CAReplicatorLayer //生成相似图层
 CATiledLayer   //大图
 CAEmitterLayer //高性能的粒子引擎
 CAEAGLLayer    //高性能图形测绘
 AVPlayerLayer //---AVFoundtaion
 
 */

/*
 http://blog.csdn.net/u011774517/article/details/66967648
 隐式动画: 因为我们并没有指定任何动画的类型，只是修改了属性，CoreAnimation来决定什么时候显示动画
 事务
 CATransaction
 setCompletionBlock //完成块
 //隐藏隐式动画
 [UIView beginAnimations:nil context:nil];//
 [CATransaction setDisableActions:YES];
 */

/*
 隐式动画的实现：
 当CALayer的属性被修改的时候，它会调用-actionForKey:方法传递名称。
 （1）图层首先检查它是否有委托，如果有CALayerDelegate，就在委托中查找-actionForLayer:forKey:方法，如果有-actionForLayer:forKey:调用它并返回。
 （2）如果没有委托或委托中没有实现-actionForLayer:forKey:方法，图层会检查actions字典，actions字典是属性名称对应行为的映射字典。
 （3）如果actions字典中没有对应的属性名称，图层就检查style字典
 （4）如果style中也没有对应的行为，那么图层将直接调用-defaultActionForKey:方法，
 搜索完，-actionForKey:方法要么返回空(不会有动画发生)，要么是CAAction协议对应的对象，然后CALayer拿这个结果对先前和当前的值做动画。
 */

/*
 显示动画
 
 */

/*
 图层时间
 */
/*
 性能调优
 运行动画的过程
 1、布局
 2、显示 draw
 3、准备
 4、提交
 5、对所有的图层属性计算中间值
 6、渲染可见三角行
 
 会影响图层绘制
 1、太多的几何结构
 2、重绘 -- 重叠的半透明图层
 3、离屏绘制
 4、过大的图片
 
 */



@implementation BYCALayerTest1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layerDemo];
//    [self layerPropertyDemo];
//    [self clockDemo];
 
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    if (_ok) {
//         [self layerDemo1];
//    } else {
//         [self showPosition];
////         [self demo1];
//    }
    
    //验证自定义行为
//    self.sublayer.backgroundColor = [UIColor redColor].CGColor;
}

- (void)layerPropertyDemo{
    //contents属性 如果不用ARC就不用__bridge
    self.sublayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"001"].CGImage);
    
    //contentMode 对应 contentsGravity
    //    contentMode = UIViewContentModeScaleAspectFit
//    self.sublayer.contentsGravity = kCAGravityCenter;
    //    self.yellow.contentScaleFactor 对应功能
    self.sublayer.contentsScale = [UIScreen mainScreen].scale;//3.0; //每个点两个像素绘制图片  支持高分辨率屏幕机制的一部分
    //    self.yellow.clipsToBounds 决定是否绘制超出部分的内容
//    self.sublayer.masksToBounds = YES;
    //显示图层的区域    单位坐标
//    self.sublayer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
//    self.sublayer.contentsCenter =  CGRectMake(0.25, 0.25, 0.5, 0.5);
    self.sublayer.delegate = self;
    
//    self.sublayer.doubleSided
    
    [self.sublayer display]; //不会自动掉用delegate里的方法
    
}


- (void)layerDemo{
    CALayer *layer = [CALayer layer];
    layer.frame = self.redView.frame;
    layer.backgroundColor = [UIColor grayColor].CGColor;
    //
    //给图层添加一个自定义的行为
//    CATransition *transition =[CATransition animation];
//    transition.type = kCATransitionPush;
//    transition.subtype = kCATransitionFromLeft;
//    layer.actions = @{@"backgroundColor":transition};
    self.sublayer = layer;
    [self.view.layer addSublayer:layer]; //添加图层
    [self showPosition];
    _ok = YES;
}
- (void)layerDemo1{

    
    self.redView.layer.anchorPoint = CGPointMake(0, 0);
//     self.sublayer.bounds.size = CGPointMake(0, 0);
    
//      self.redView.layer.position = CGPointMake(200,300);
     _ok = NO;
//    [self demo1];
}

- (void)showPosition{
    
    NSLog(@"UIView,center=%@",NSStringFromCGPoint( self.redView.center) );
    NSLog(@"frame=%@",NSStringFromCGRect(self.redView.layer.frame) );
    NSLog(@"bounds=%@",NSStringFromCGRect(self.redView.layer.bounds));
    NSLog(@"position=%@",NSStringFromCGPoint(self.redView.layer.position) );
//    NSLog(@"contentsCenter=%@",NSStringFromCGRect(self.redView.layer.contentsCenter));
}

- (void)demo1{
    [UIView animateWithDuration:1 delay:5 options:UIViewAnimationOptionCurveLinear animations:^{
//          [_sublayer setValue:@0.5 forKeyPath:@"transform.scale"];
         _sublayer.transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
    } completion:^(BOOL finished) {
        
    }];
    
//    [UIView animateWithDuration:1 animations:^{
//
//        //        _imageView.layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
//
//        //利用KVC
//
//        //修改属性transform的值为CATransform3DMakeRotation(M_PI, 1, 0, 0)
//        //        CATransform3DMakeRotation(M_PI, 1, 0, 0)为结构体类型
//        //        Value要一个对象类型
//        //        把结构体转换成对象
//        //
//        NSValue *value = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 0, 0)];
//        [_redView.layer setValue:@0.5 forKeyPath:@"transform.scale"];
//
//    }];
}

#pragma mark CALayerDelegate

- (void)displayLayer:(CALayer *)layer{
    NSLog(@"%s",__func__);
     layer.contents = (__bridge id)([UIImage imageNamed:@"001"].CGImage);
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    NSLog(@"%s",__func__);
    
    CGContextSetLineWidth(ctx, 2.0);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

- (void)layerWillDraw:(CALayer *)layer{
    NSLog(@"%s",__func__);
}

- (void)layoutSublayersOfLayer:(CALayer *)layer{
    NSLog(@"%s",__func__);
}

- (void)CATransactionDeom{
    //动画底层都是包装成一个事务.
    //有很多操作绑定在一起, 当这些操作全部执行完毕时,它才进行下一步工作.
    
    [CATransaction begin];
    //
    //    //设置事务有没有动画
    [CATransaction setDisableActions:YES];
    //设置事务动画的执行时长.
    [CATransaction setAnimationDuration:0];
    
    self.sublayer.bounds = CGRectMake(0, 0, arc4random_uniform(200), arc4random_uniform(200));
    self.sublayer.position = CGPointMake(arc4random_uniform(300), arc4random_uniform(400));
    self.sublayer.backgroundColor = [self randomColor].CGColor;
    self.sublayer.cornerRadius = arc4random_uniform(50);
    
    [CATransaction commit];
}

- (UIColor *)randomColor{
    CGFloat r = arc4random_uniform(256) /255.0;
    CGFloat g = arc4random_uniform(256) /255.0;
    CGFloat b = arc4random_uniform(256) /255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}





#pragma mark ClockDemo
-(void)clockDemo{
    //添加时针
    [self addHour];
    
    //添加分针
    [self addMinue];
    
    //添加秒针
    [self addSecond];
    
    //添加定时器
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChage) userInfo:nil repeats:YES];
    [self timeChage];
}

//每一少调用一次
- (void)timeChage{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //components日历单元:年,月,日,时,分,秒
    //fromDate:从哪个时间开始取
    
    
    NSDateComponents *cmp = [calendar components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];
    //获取当前是多少秒
    NSInteger curSecond =  cmp.second;
    //获取当前是多少分
    NSInteger curMinute =  cmp.minute;
    
    //获取当前是多少小时
    NSInteger curHour = cmp.hour;
    
    
    //秒针旋转多少度.
    CGFloat angle = curSecond * perSecondA;
    self.secondL.transform = CATransform3DMakeRotation(angle2Rad(angle), 0, 0, 1);
    
    
    //让分针开始旋转
    CGFloat minuteA = curMinute * perMinA;
    self.minuteL.transform =  CATransform3DMakeRotation(angle2Rad(minuteA), 0, 0, 1);
    
    //让时针开始旋转
    CGFloat hourA = curHour * perHourA + curMinute * perMinHour;
    self.hourL.transform =  CATransform3DMakeRotation(angle2Rad(hourA), 0, 0, 1);
    
    
}

//添加秒针
- (void)addSecond{
    
    //一般做旋转,缩放,都是根据锚点进旋转,缩放
    
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 1, 80);
    layer.position = CGPointMake(self.clockView.bounds.size.width * 0.5, self.clockView.bounds.size.height * 0.5);
    layer.anchorPoint = CGPointMake(0.5, 1);
    self.secondL = layer;
    [self.clockView.layer addSublayer:layer];
    
}

//添加秒针
- (void)addMinue{
    
    //一般做旋转,缩放,都是根据锚点进旋转,缩放
    
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor blackColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 3, 70);
    layer.position = CGPointMake(self.clockView.bounds.size.width * 0.5, self.clockView.bounds.size.height * 0.5);
    layer.anchorPoint = CGPointMake(0.5, 1);
    self.minuteL = layer;
    [self.clockView.layer addSublayer:layer];
    
}


//添加时针
- (void)addHour{
    
    //一般做旋转,缩放,都是根据锚点进旋转,缩放
    
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor blackColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 3, 50);
    layer.position = CGPointMake(self.clockView.bounds.size.width * 0.5, self.clockView.bounds.size.height * 0.5);
    layer.anchorPoint = CGPointMake(0.5, 1);
    self.hourL = layer;
    [self.clockView.layer addSublayer:layer];
    
}


@end
