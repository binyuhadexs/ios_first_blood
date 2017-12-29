//
//  BYTableViewViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/8/27.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYTableViewViewController.h"
#import "BYWebViewController.h"
#import "BYWebPramaWrapper.h"

@interface BYTableViewViewController ()<UITableViewDelegate,UITableViewDataSource>
//@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation BYTableViewViewController
- (void)viewDidLoad {
    [super viewDidLoad];
   CGRect mains= [UIScreen mainScreen].bounds;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, mains.size.width,mains.size.height-64) style:UITableViewStyleGrouped];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:_tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self loadTableList];
    [self.tableView reloadData];
    [self by_viewDidLoad];
    
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

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
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
    [self didSelectRowAtIndexPath:indexPath];
}

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *items =  _datas[indexPath.section];
    NSDictionary *diction =  items[indexPath.row];
    NSString *controllerString =  diction[@"controller"];
    
    if ([@"BYWebViewController" isEqualToString:controllerString]) {
        BYWebViewController *viewController= [[BYWebViewController alloc] init];
        BYWebPramaWrapper *wrapper = [[BYWebPramaWrapper alloc] init];
        wrapper.url =  diction[@"url"];
        viewController.wrapper =wrapper;
        [self.navigationController pushViewController:viewController animated:YES];
        return;
    }
    
    Class cotrollerClass =  NSClassFromString(controllerString);
    if (cotrollerClass) {
        UIViewController *viewController =  [[cotrollerClass alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}



- (void)loadTableList{
    NSString *source = [self by_fileNamePlistSource];
    if (source) {
        NSString *path = [[NSBundle mainBundle] pathForResource:source ofType:@"plist"];
        self.datas = [[NSArray alloc] initWithContentsOfFile:path];
        return;
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"UIItem" ofType:@"plist"];
    self.datas = [[NSArray alloc] initWithContentsOfFile:path];
}

- (NSString *)by_fileNamePlistSource{
    return nil;
}


- (void)by_viewDidLoad{
    
}

@end
