//
//  DrawView.m
//  06-画板
//
//  Created by Gavin on 15/9/14.
//  Copyright © 2015年 Gavin. All rights reserved.
//

#import "DrawView.h"
#import "MyBezierPath.h"

@interface DrawView()

@property(nonatomic,strong)UIBezierPath *path;

@property(nonatomic,strong)NSMutableArray *pathArray;

@property(nonatomic,assign)CGFloat Width;

@property(nonatomic,strong)UIColor *color;

@end

@implementation DrawView


-(NSMutableArray *)pathArray{
    if (_pathArray == nil) {
        _pathArray = [NSMutableArray array];
    }
    return _pathArray;
}


//清屏
- (void)clear{
    [self.pathArray removeAllObjects];
    [self setNeedsDisplay];
}
//撤销
- (void)undo{
    
    [self.pathArray removeLastObject];
    [self setNeedsDisplay];
}
//橡皮擦
- (void)erase{
    
    [self setLineColor:[UIColor whiteColor]];

}

//设置线的宽度
- (void)setLineWidth:(CGFloat)width{

    self.Width = width;
    [self setNeedsDisplay];// my 可有可无
    
}
//设置颜色
- (void)setLineColor:(UIColor *)color{
    
    self.color = color;
    [self setNeedsDisplay];// my 可有可无
    
}


-(void)setImage:(UIImage *)image{
    _image = image;
    
    [self.pathArray addObject:image];
    
    [self setNeedsDisplay];
    
}



-(void)awakeFromNib{

    //添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    self.Width = 1;
    self.color = [UIColor blackColor];
    [self addGestureRecognizer:pan];
    
}

- (void)pan:(UIPanGestureRecognizer *)pan{

    CGPoint curP = [pan locationInView:self];
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        MyBezierPath *path = [[MyBezierPath alloc] init];
        self.path = path;
        //设置线宽度
        [path setLineWidth:self.Width];
        [self.pathArray addObject:path];
        path.color = self.color;
        [path moveToPoint:curP];
    }else if(pan.state  == UIGestureRecognizerStateChanged){
        [self.path addLineToPoint:curP];
        
        [self setNeedsDisplay];
        
    }
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //取出所有的路径
    for (MyBezierPath *path in self.pathArray) {
        
        if ([path isKindOfClass:[UIImage class]]) {
            UIImage *image = (UIImage *)path;
            [image drawInRect:rect];
        }else{

            [path.color set];
            [path stroke];
        }
        
   
    }
    

    
}

@end
