//
//  BYLabelTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/10/5.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYLabelTestViewController.h"

@interface BYLabelTestViewController ()
@property (weak, nonatomic) IBOutlet UILabel *test;

@end

@implementation BYLabelTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self editeLabel];
    
    [self addLable];
}



- (void)editeLabel{
    _test.text = @"设置文本";
    

}

- (void)addLable{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 20)];
    
    label.backgroundColor = [UIColor grayColor];
    label.tag = 1;
    label.text = @"文本设置";
    label.textColor = [UIColor blueColor];
    label.font = [UIFont systemFontOfSize:30]; //
    label.textAlignment = NSTextAlignmentCenter; //对齐方式
//    label.lineBreakMode = 
    [self.view addSubview:label];
}

@end
