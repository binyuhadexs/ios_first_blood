//
//  BYUIViewTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/8/21.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYUIViewTestViewController.h"

@implementation BYUIViewTestViewController

/*
 Navigationbar bug
 http://www.jianshu.com/p/e4448c24d900
 */

- (NSString *)by_fileNamePlistSource{
    return @"UIItem";
}

- (void)by_viewDidLoad{
    self.title = @"UI基础";
}


@end
