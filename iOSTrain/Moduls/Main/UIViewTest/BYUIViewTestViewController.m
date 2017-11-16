//
//  BYUIViewTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/8/21.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYUIViewTestViewController.h"

@interface BYUIViewTestViewController () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray<NSArray *> *datas;

@end

@implementation BYUIViewTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"基础控件";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self datas];
    [self.tableView reloadData];
    
    //去掉选中背景颜色的三种方法
    //1、cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //2、self.tableView.allowsSelection = NO;  不会回调  didSelectRowAtIndexPath
    //3、self.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    //   self.selectedBackgroundView.backgroundColor = [UIColor redColor];
}


#pragma -mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;

}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

#pragma -mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _datas ?_datas.count : 0;
}

//设置每组的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datas ?_datas[section].count : 0;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"first"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *items =  _datas[indexPath.section];
    NSDictionary *diction =  items[indexPath.row];
    cell.textLabel.text = diction[@"name"];
    return cell;

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *items =  _datas[indexPath.section];
    NSDictionary *diction =  items[indexPath.row];
    NSString *controllerString =  diction[@"controller"];
    
    Class cotrollerClass =  NSClassFromString(controllerString);
    UIViewController *viewController =  [[cotrollerClass alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:viewController animated:YES];
    
}



- (NSArray *)datas{
    if (!_datas) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"UIItem" ofType:@"plist"];
        _datas = [[NSArray alloc] initWithContentsOfFile:path];
    }
    return _datas;
}






@end
