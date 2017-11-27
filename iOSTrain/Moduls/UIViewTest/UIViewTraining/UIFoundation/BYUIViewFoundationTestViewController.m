//
//  BYUIViewTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/22.
//  Copyright © 2017年 binyu. All rights reserved.
//
//http://www.cocoachina.com/ios/20151110/14067.html

#import "BYUIViewFoundationTestViewController.h"


@interface BYUIViewFoundationTestViewController ()
@property (weak, nonatomic) IBOutlet UIButton *fistButtion;
@property (weak, nonatomic) IBOutlet UIButton *secendButton;
@property (weak, nonatomic) IBOutlet UISwitch *switchView;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIView *stateYellowView;

@end
/*
 UI基础控件
 UIButton
 UIAlertController
 UISwitch
 UIStepper
 UIActivityIndicatorView
 UISlider
 UISegmentedControl
 UIImageView
 UITextField
 UILabel
 */

/*
 遗留问题
 UIImage
 
 NSAttributedString
 */
/*
 
 IOS如何选择图片加载方式：imageNamed和imageWithContentsOfFile的区别 ?????
 http://blog.csdn.net/wzzvictory/article/details/9053813
 
 */
@implementation BYUIViewFoundationTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self ButtionDemo];
    [self SwitchViewDemo];
    [self UIStepperDemo];
    [self UISliderDemo];
    [self UISegmentedControlDemo];
//    [self UITextFieldDemo];
    [self UIImageViewDemo];
    
}

/*
 NSObject
 UIResponder
 UIView
 UIControl
 UIButton
 */
#pragma mark  UIButton
-(void)ButtionDemo{
    [self.fistButtion addTarget:self action:@selector(UIActivityIndicatorViewDemo) forControlEvents:UIControlEventTouchUpInside];
}

-(void)ButtionDemo1{
    
    
}
-(void)ButtionDemo2{
    
    
}

#pragma mark  UIStepper
-(void)UIStepperDemo{
    self.stepper.minimumValue = 1;//最小值
    self.stepper.maximumValue = 10.0;//最大值
    self.stepper.stepValue = 1;
    //    self.stepper.continuous = NO; 是否每次变化都回调
    //    self.stepper.autorepeat = NO; 长按
    //    self.stepper.wraps = YES;//判断是否循环,即到最大值后又从最小值开始
    
    self.stepper.tintColor = [UIColor whiteColor];//设置按钮的颜色;
    [self.stepper setBackgroundColor:[UIColor orangeColor]];//设置背景颜色
    //    [self.stepper setBackgroundImage:[UIImage imageNamed:@"001.png"] forState:UIControlStateNormal];//设置背景图片
    [ self.stepper addTarget:self action:@selector(stepperAction)
            forControlEvents:UIControlEventValueChanged];
}

-(void)stepperAction{
    self.label.text = [NSString stringWithFormat:@"%f",self.stepper.value];//
}

#pragma mark  UIActivityIndicatorView

-(void)UIActivityIndicatorViewDemo{
    //UIActivityIndicatorViewStyleWhiteLarge UIActivityIndicatorViewStyleGray  UIActivityIndicatorViewStyleWhite
    self.indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    self.indicator.backgroundColor = [UIColor grayColor];
    //    self.indicator.color = [UIColor blueColor];
    [self.indicator startAnimating];
}

#pragma mark  UISwitch
-(void)SwitchViewDemo{
    // 设置背景色
    //     self.switchView.backgroundColor = [UIColor grayColor];
    // 设置透明度 范围在0.0-1.0之间 0.0是完全透明
    //    self.switchView.alpha = 0.5;
    // 在oneSwitch开启的状态显示的颜色 默认是blueColor
    self.switchView.onTintColor = [UIColor redColor];
    // 设置关闭状态的颜色
    self.switchView.tintColor = [UIColor blueColor];
    // 设置开关上左右滑动的小圆点的颜色
    self.switchView.thumbTintColor = [UIColor cyanColor];
    // 设置初始状态 直接设置为on，你不回观察到它的变化
    //    self.switchView.on = YES;
    // 设置初始状态，与上面的不同是当你看到这个控件的时候再开始设置为on，你会观察到他的变化
    //    [self.switchView setOn:NO animated:YES];
    // 打开状态显示的图片<然并卵>
    //    self.switchView.onImage = [UIImage imageNamed:@"2"];
    //关闭状态下的图片<然并卵>
    //    self.switchView.offImage = [UIImage imageNamed:@"3"];
    [self.switchView addTarget:self action:@selector(UIAlertControllerDemo2) forControlEvents:UIControlEventValueChanged];
    
}

#pragma mark  UISlider
-(void)UISliderDemo{
    //
    //http://www.jianshu.com/p/b7a4ff0bdee4
    self.slider.maximumValue = 100;
    self.slider.minimumValue = 0;
    self.slider.value = 1;
    self.slider.thumbTintColor = [UIColor redColor];
    self.slider.minimumTrackTintColor = [UIColor orangeColor];
    self.slider.maximumTrackTintColor = [UIColor greenColor];
    [self.slider addTarget:self action:@selector(sliderAction) forControlEvents: UIControlEventValueChanged];
}

-(void)sliderAction{
    self.label.text = [NSString stringWithFormat:@"%f",self.slider.value];//
}

#pragma mark  UISegmentedControl
- (void)UISegmentedControlDemo{
    //    self.segmentedControl.momentary = YES;//默认是NO,如果设置为YES,点击结束后将不保持选中状态.
    [self.segmentedControl insertSegmentWithTitle:@"开挂" atIndex:0 animated:NO];
    [self.segmentedControl setWidth:50 forSegmentAtIndex:0];//根据索引设置相应标签宽度:如果设置为0.0，则为自适应，默认为此设置.
    [self.segmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateNormal];
    //设置选中状态下的文字颜色和字体
    [self.segmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateSelected];
    //添加监听
    [self.segmentedControl addTarget:self action:@selector(segmentedControlAction) forControlEvents:UIControlEventValueChanged];
}

-(void)segmentedControlAction{
    //修改底部线的frame值产生动画
    [UIView animateWithDuration:0.25 animations:^{
        CGPoint point =  self.stateYellowView.center;
        point.x = self.stateYellowView.frame.size.width /2 * (self.segmentedControl.selectedSegmentIndex + 1);
        self.stateYellowView.center = point;
    }];
}

#pragma mark  UITextField
- (void)UITextFieldDemo{
    //http://www.jianshu.com/p/0517bfd9957c
    //http://www.jianshu.com/p/f93b005dc9d4
    self.textField.text = @"textField";
    self.textField.borderStyle = UITextBorderStyleRoundedRect; //边框
    //    self.textField.userInteractionEnabled = NO;//只可显示不可编辑的,
    
    //placeholder设置字体颜色，大小
    //    方法一：
    self.textField.placeholder = @"密码输入框";  // 提示文本
    //    [self.textField setValue:[UIColor colorWithRed:79/255.0f green:79/255.0f blue:79/255.0f alpha:0.5f] forKeyPath:@"_placeholderLabel.textColor"];
    //    [self.textField setValue:[UIFont boldSystemFontOfSize:20] forKeyPath:@"_placeholderLabel.font"];
    
    //    方法二：
    self.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"密码输入框"
                                                                           attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:79/255.0f green:79/255.0f blue:79/255.0f alpha:0.5f],
                                                                                        NSFontAttributeName : [UIFont systemFontOfSize:20 weight:6],}];
    
    //font属性
    self.textField.font = [UIFont systemFontOfSize:14.0f];
    self.textField.textColor = [UIColor redColor];
    
    //根据输入文字动态调整字体大小,需要设置一个最小字体大小
    self.textField.adjustsFontSizeToFitWidth = YES;
    self.textField.minimumFontSize = 10.0;//设置最小字体
    
    //设置输入内容的对其方式
    self.textField.textAlignment = NSTextAlignmentLeft;
    
    //与键盘相关的属性
    self.textField.keyboardType = UIKeyboardTypeDefault;////设置键盘的样式
    self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;  //首字母是否自动大写
    self.textField.keyboardAppearance=UIKeyboardAppearanceDefault; //键盘外观
    self.textField.returnKeyType =UIReturnKeyDone;   //return键变成什么键
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
//    self.textField.secureTextEntry = YES;//设置成YES则类似于密码框内容将显示为圆点。
    
//    self.textField.delegate = self; //代理方法
    
    
}


#pragma mark  UIImageView
-(void)UIImageViewDemo{
    self.imageView.tintColor = [UIColor redColor];
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    UIImage *image =   [UIImage imageNamed:@"copy"];
    [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.imageView.image = image;
//    imageView.animationImages = imagesArray;
//    // 设定所有的图片在多少秒内播放完毕
//    imageView.animationDuration = [imagesArray count];
//    // 不重复播放多少遍，0表示无数遍
//    imageView.animationRepeatCount = 0;
//    // 开始播放
//    [imageView startAnimating];
    
}



/*
 UIImage
 
 */



#pragma mark  UIAlertController
/*
 UIAlertController
 */
-(void)UIAlertControllerDemo{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
                                                                   message:@"This is an alert."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive
                                                          handler:^(UIAlertAction * action) {}];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * action) {}];
    //KVC  http://www.jianshu.com/p/51949eec2e9c
    NSMutableAttributedString *alertControllerStr = [[NSMutableAttributedString alloc] initWithString:@"提示"];
    [alertControllerStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 2)];
    [alertControllerStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range:NSMakeRange(0, 2)];
    [alert setValue:alertControllerStr forKey:@"attributedTitle"];
    //    defaultAction.
    [alert addAction:defaultAction];
    
    [cancelAction setValue:[UIColor greenColor] forKey:@"titleTextColor"];
    [alert addAction:cancelAction];
    //    [alert addAction:destructiveAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

-(void)UIAlertControllerDemo1{
    //创建提示框窗口
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"System Info" message:@"......" preferredStyle:UIAlertControllerStyleAlert];
    //实例化取消按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        //点击取消按钮后控制台打印语句。
        NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
    }];
    //实例化确定按钮
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"The \"Okay/Cancel\" alert's other action occured.");
    }];
    
    //向弹出框中添加按钮和文本框
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        // 可以在这里对textfield进行定制，例如改变背景色等
        textField.text = @"1111111";
    }];
    UITextField *textField =   alertController.textFields[0];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //将提示框弹出
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)UIAlertControllerDemo2{
    //创建提示框窗口
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"System Info" message:@"......" preferredStyle:UIAlertControllerStyleActionSheet];
    //实例化取消按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        //点击取消按钮后控制台打印语句。
        NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
    }];
    //实例化确定按钮
    UIAlertAction *otherAction1 = [UIAlertAction actionWithTitle:@"1" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"The \"Okay/Cancel\" alert's other action occured.");
    }];
    UIAlertAction *otherAction2 = [UIAlertAction actionWithTitle:@"2" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"The \"Okay/Cancel\" alert's other action occured.");
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction1];
    [alertController addAction:otherAction2];
    [self presentViewController:alertController animated:YES completion:nil];
}



@end
