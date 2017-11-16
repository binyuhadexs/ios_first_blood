//
//  BYViewTest1ViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/11.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYViewTest1ViewController.h"
#import "Masonry.h"

@interface BYViewTest1ViewController ()
@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (strong, nonatomic) IBOutlet UIView *rootView;
@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

@implementation BYViewTest1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //为什么在XIB设置的颜色不存在 ？？

//    frame 占用空间
    //bounds 边界
    //center 决定位置
    /*
     bounds 和 center 相互独立，修改不会相互影响
     
     */
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self testFrameOrigin];
//    [self testFrameSize];
//    [self testBoundsOrigin];
//    [self testBoundsSize];
    
    
//    [self testTraSize];
//    [self testTranslationSize];

//    [self testSetCenter];
    
    [self test];
}

- (void)test{
    [self logYellowViewInfo];
    [self.yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
//        MASBoxValue a;
        make.width.height.mas_equalTo(260);
//        make.left.mas_equalTo(56);
//        make.top.mas_equalTo(120);
//        make.left.top.equalTo(self.yellowView);
//        [self logYellowViewInfo];
    }];
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0/*延迟执行时间*/ * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [self logYellowViewInfo];
    });
    
    
}

- (void) testTranslationSize{
    //旋转后frame 发生改变 bounds不变
    [self logYellowViewInfo];
    [UIView transitionWithView:self.yellowView duration:1 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.yellowView.transform = CGAffineTransformMakeTranslation(20, 20);
    } completion:^(BOOL finished) {
        [self logYellowViewInfo];
    }];
}

- (void) testTraSize{
    //旋转后frame 发生改变 bounds不变
    [self logYellowViewInfo];
    [UIView transitionWithView:self.yellowView duration:1 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.yellowView.transform = CGAffineTransformMakeRotation(M_PI_4);
    } completion:^(BOOL finished) {
        [self logYellowViewInfo];
    }];
}


- (void) testSetCenter{
    //决定位置
    [self logYellowViewInfo];
    [self.yellowView setCenter:CGPointMake(self.yellowView.center.x + 20, self.yellowView.center.y + 20)];
    [self logYellowViewInfo];
}


- (void) testBoundsSize{
    //改变 bounds的size center不变 改变自己大小和origin改变-->子视图的位置
    [self logYellowViewInfo];
    CGRect bounds =  self.yellowView.bounds;
    bounds.size.height = bounds.size.height+ 20;
    bounds.size.width = bounds.size.width + 20;
    self.yellowView.bounds = bounds;
    [self logYellowViewInfo];
}


- (void) testBoundsOrigin{
    //改变 bounds origin改变 center，大小不变，改变自视图的坐标体系
    [self logYellowViewInfo];
    CGRect bounds =  self.yellowView.bounds;
    bounds.origin.x = bounds.origin.x + 20;
    bounds.origin.y = bounds.origin.y + 20;
    self.yellowView.bounds = bounds;
    [self logYellowViewInfo];
}

- (void) testFrameOrigin{
     //改变origin 改变center 本视图和子视图位置改变 -- 子视图相对位置不变
    [self logYellowViewInfo];
    CGRect frame =  self.yellowView.frame;
    frame.origin.x = frame.origin.x + 20;
    frame.origin.y = frame.origin.y + 20;
    self.yellowView.frame = frame;
    [self logYellowViewInfo];
}


- (void)testFrameSize{
    //改变大小 改变center 子视图位置不变
    [self logYellowViewInfo];
    CGRect frame =  self.yellowView.frame;
    frame.size.width = frame.size.width - 20;
    frame.size.height = frame.size.height - 20;
    self.yellowView.frame = frame;
    [self logYellowViewInfo];
}

- (void)logYellowViewInfo{
    [self logViewPositionInfo:self.yellowView];
    [self logViewPositionInfo:self.blueView];
}

- (void)logViewPositionInfo:(UIView *)view{
    NSLog(@"frame=%@",NSStringFromCGRect(view.frame));
    NSLog(@"bounds=%@",NSStringFromCGRect(view.bounds));
    NSLog(@"center=%@",NSStringFromCGPoint(view.center));
    NSLog(@"_________————————_____");
}

@end
