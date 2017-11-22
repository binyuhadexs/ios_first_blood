//
//  BYSDWebImageViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/16.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYSDWebImageViewController.h"

/*
 内存缓存 NSCache
 磁盘缓存 文件存储
 
 */

@interface BYSDWebImageViewController ()

@end



@implementation BYSDWebImageViewController

- (void)loadTableList{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sdwebimage" ofType:@"plist"];
    self.datas = [[NSArray alloc] initWithContentsOfFile:path];
}

- (void)by_viewDidLoad{
    self.title = @"图片缓存";
}


@end
