//
//  BYQuartsCoreTest3ViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/23.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYQuartsCoreTest3ViewController.h"
#import "DrawView.h"
#import "HandleImageView.h"

@interface BYQuartsCoreTest3ViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIGestureRecognizerDelegate,HandleImageViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *clearItem;
@property (weak, nonatomic) IBOutlet DrawView *drawView;

@end

@implementation BYQuartsCoreTest3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//清除
- (IBAction)clear:(UIBarButtonItem *)sender {
     [self.drawView clear];
}

//撤销
- (IBAction)undo:(UIBarButtonItem *)sender {
      [self.drawView undo];
}

//橡皮
- (IBAction)erase:(UIBarButtonItem *)sender {
     [self.drawView erase];
}

//保存
- (IBAction)save:(id)sender {
    //1.把画板东西生成一张图片保存
    UIGraphicsBeginImageContextWithOptions(self.drawView.bounds.size, NO, 0);
    
    CGContextRef ctx =  UIGraphicsGetCurrentContext();
    
    [self.drawView.layer renderInContext:ctx];
    
    //生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文.
    UIGraphicsEndImageContext();
    
    //写到系统相册当中
    
    //注意,保存成功调用的方法必须得是
    //- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
//    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}



//选择照片
- (IBAction)chosePic:(id)sender {
    //系统相册控制器
    UIImagePickerController *pickVC = [[UIImagePickerController alloc] init];
    
    //设置照片的来源
    pickVC.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    //设置代理
    pickVC.delegate = self;
    //modal出系统相册控制器
    [self presentViewController:pickVC animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //获取当前选中的图片.通过UIImagePickerControllerOriginalImage就能获取.
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    HandleImageView *handView = [[HandleImageView alloc] init];
    handView.frame = self.drawView.bounds;
    handView.image = image;
    handView.delegate = self;
    
    
    NSLog(@"%@", handView.backgroundColor);
    [self.drawView addSubview:handView];
    
    //    self.drawView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)handleImageView:(HandleImageView *)handleImageV newImage:(UIImage *)image{
    
    self.drawView.image = image;
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    NSLog(@"保存成功");
    
}


//设置线宽
- (IBAction)valueChange:(UISlider *)sender {
      [self.drawView setLineWidth:sender.value];
}

//设置颜色
- (IBAction)setColor:(UIButton *)sender {
    [self.drawView setLineColor:sender.backgroundColor];
}

@end
