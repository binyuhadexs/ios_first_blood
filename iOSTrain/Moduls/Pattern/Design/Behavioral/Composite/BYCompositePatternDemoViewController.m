//
//  BYCompositePatternDemoViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/12/17.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYCompositePatternDemoViewController.h"
#import "File.h"
#import "BYFileViewController.h"

/*
 组合模式
 主要解决：它在我们树型结构的问题中，模糊了简单元素和复杂元素的概念，客户程序可以向处理简单元素一样来处理复杂元素，从而使得客户程序与复杂元素的内部结构解耦。
 何时使用： 1、您想表示对象的部分-整体层次结构（树形结构）。 2、您希望用户忽略组合对象与单个对象的不同，用户将统一地使用组合结构中的所有对象。
 如何解决：树枝和叶子实现统一接口，树枝内部组合该接口。
 关键代码：树枝内部组合该接口，并且含有内部属性 List，里面放 Component。
 
 
 */

@interface BYCompositePatternDemoViewController ()
@property (nonatomic, strong) File *root;
@end

@implementation BYCompositePatternDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 1.创建根节点
    self.root = [File fileWithFileType:kFolder fileName:@"root"];
    
    // 2.创建第一级文件
    File *folder_A_1 = [File fileWithFileType:kFolder fileName:@"Folder_A_1"];
    File *file_A_1 = [File fileWithFileType:kFile fileName:@"File_A_1"];
    File *file_A_2 = [File fileWithFileType:kFile fileName:@"File_A_2"];
    File *file_A_3 = [File fileWithFileType:kFile fileName:@"File_A_3"];
    
    
    // 3.创建第二级文件
    File *folder_B_1 = [File fileWithFileType:kFolder fileName:@"Folder_B_1"];
    File *file_B_1 = [File fileWithFileType:kFile fileName:@"File_B_1"];
    File *file_B_2 = [File fileWithFileType:kFile fileName:@"File_B_2"];
    File *folder_B_2 = [File fileWithFileType:kFolder fileName:@"Folder_B_2"];
    
    // 4.创建第二级文件
    File *folder_C_1 = [File fileWithFileType:kFolder fileName:@"Folder_C_1"];
    File *file_C_1 = [File fileWithFileType:kFile fileName:@"File_C_1"];
    File *file_C_2 = [File fileWithFileType:kFile fileName:@"File_C_2"];
    
    
    [self.root addFile:folder_A_1];
    [self.root addFile:file_A_1];
    [self.root addFile:file_A_2];
    [self.root addFile:file_A_3];
    
    [folder_A_1 addFile:folder_B_1];
    [folder_A_1 addFile:file_B_1];
    [folder_A_1 addFile:file_B_2];
    [folder_A_1 addFile:folder_B_2];
    
    [folder_B_1 addFile:folder_C_1];
    [folder_B_1 addFile:file_C_1];
    [folder_B_1 addFile:file_C_2];
    
    
    BYFileViewController *controller = [[BYFileViewController alloc] init];
    controller.rootFile = _root;
    [self addChildViewController:controller];
    [self.view addSubview:controller.view];
}





@end
