//
//  FileCellTableViewCell.h
//  iOSTrain
//
//  Created by binyu on 2017/12/19.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "File.h"

@interface FileTableViewCell : UITableViewCell

@property (nonatomic, weak) id                data;
@property (nonatomic, weak) NSIndexPath      *indexPath;
@property (nonatomic, weak) UITableView      *tableView;
@property (nonatomic, weak) UIViewController *controller;

- (void)loadContent;

@end
