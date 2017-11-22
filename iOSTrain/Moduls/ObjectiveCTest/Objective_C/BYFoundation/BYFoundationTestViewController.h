//
//  BYFoundationTestViewController.h
//  iOSTrain
//
//  Created by binyu on 2017/10/28.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYTableViewViewController.h"
@protocol TestProtocol<NSObject>

@required


- (void)test;

@optional

@end

@interface BYFoundationTestViewController : BYTableViewViewController

@end
