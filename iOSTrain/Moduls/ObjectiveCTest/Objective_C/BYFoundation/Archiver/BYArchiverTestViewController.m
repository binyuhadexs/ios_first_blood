//
//  BYArchiverTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/21.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYArchiverTestViewController.h"
#import "BYWorker.h"

@interface BYArchiverTestViewController ()

@property (nonatomic,strong)BYWorker *worker;

@end

@implementation BYArchiverTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.worker = [[BYWorker alloc] init];
    self.worker.name = @"张三";
    self.worker.age = 12;
    
    NSLog(@"worker=%p",self.worker.name);
    [self archiver];
    
     NSString *NAME = @"张三";
     NSLog(@"NAME=%p",NAME);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self unarchiver];
}

-(void)archiver{
    NSString * temp = NSTemporaryDirectory();
    NSString * filePath = [temp stringByAppendingPathComponent:@"binyu.xia"];
    
    //归档
    [NSKeyedArchiver archiveRootObject:self.worker toFile:filePath];
}
-(void)unarchiver{
    NSString * temp = NSTemporaryDirectory();
    NSString * filePath = [temp stringByAppendingPathComponent:@"binyu.xia"];
    
    //归档
    BYWorker *worker =  [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"worker%@,worker=%p,name=%p",worker,worker,worker.name);
}

@end
