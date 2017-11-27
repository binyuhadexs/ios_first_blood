//
//  BYQuartsCoreTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/23.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYQuartsCoreTestViewController.h"

@interface BYQuartsCoreTestViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic,weak) UIView *coverView;
//手指开始点
@property(nonatomic,assign)CGPoint startP;

@end
/*
 UIPanGestureRecognizer
 推动手势
 
 */

@implementation BYQuartsCoreTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(UIView *)coverView{
    
    if (_coverView == nil) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.7;
        [self.view addSubview:view];
        _coverView = view;
    }
    return _coverView;
    
}


- (IBAction)pan:(UIPanGestureRecognizer *)pan {
    [self ClearRectDemo:pan];
}
- (void)clipDemo:(UIPanGestureRecognizer *)pan{
    //获取当前手指所在的点.
    CGPoint curP = [pan locationInView:self.view];
    if(pan.state == UIGestureRecognizerStateBegan){
        
        CGPoint startP = curP;
        self.startP = startP;
        
    }else if(pan.state == UIGestureRecognizerStateChanged){
        
        CGFloat offsetX = curP.x - self.startP.x;
        CGFloat offsetY = curP.y - self.startP.y;
        //确定遮盖的区域位置
        CGRect rect = CGRectMake(self.startP.x, self.startP.y, offsetX, offsetY);
        //每次移动时,调用遮盖的Frame.
        self.coverView.frame = rect;
    }else if(pan.state == UIGestureRecognizerStateEnded){
        //1.开启一个跟原始图片相同大小的图片上下文.
        UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, NO, 0);
        //把self.cover.frame 设为裁剪区域
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.coverView.frame];
        [path addClip];
        //获取当前上下文.
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        //把UIImageView当中的图片给绘制上下文当中.
        [self.imageView.layer renderInContext:ctx];
        //从上下文当中生成一张新的图片
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        //关闭上下文.
        UIGraphicsEndImageContext();
        //给图片重新赋值
        self.imageView.image = newImage;
        //移除遮盖
        [self.coverView removeFromSuperview];
        
    }
}


- (void)ClearRectDemo:(UIPanGestureRecognizer *)pan{
    //获取当前手指所在的点
    CGPoint curP = [pan locationInView:self.imageView];
    CGFloat rectWH = 10;
    CGFloat x = curP.x - rectWH * 0.5;
    CGFloat y = curP.y - rectWH * 0.5;
    CGRect rect =   CGRectMake(x, y, rectWH, rectWH);
    
    //开启一个图片上下文.
    UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, NO, 0);
    
    //获取当前的上下文.
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //把UImageViwe上面的图片给绘制到上下文.
    [self.imageView.layer renderInContext:ctx];
    
    //确定擦除区域
    CGContextClearRect(ctx, rect);
    
    //生成一张新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //把上下文给关闭
    UIGraphicsEndImageContext();
    //给原来图片重新赋值
    self.imageView.image = newImage;
}

@end
