//
//  BYWEEKDemoViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/12/4.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYWEEKDemoViewController.h"
#import <WeexSDK/WeexSDK.h>

@interface BYWEEKDemoViewController ()

@property (nonatomic,strong) WXSDKInstance *instance;
@property (nonatomic,strong) UIView *weexView;
@property (nonatomic, strong) NSURL *url;

@end

@implementation BYWEEKDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self render];
}


- (void)render
{
    _instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    _instance.frame = CGRectMake(self.view.frame.size.width-width, 0, width, height);
    
    __weak typeof(self) weakSelf = self;
    _instance.onCreate = ^(UIView *view) {
        [weakSelf.weexView removeFromSuperview];
        weakSelf.weexView = view;
        [weakSelf.view addSubview:weakSelf.weexView];
        UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, weakSelf.weexView);
    };
    _instance.onFailed = ^(NSError *error) {
        NSLog(@"failed %@",error);
    };
    
    _instance.renderFinish = ^(UIView *view) {
        NSLog(@"render finish");
    };
    
    _instance.updateFinish = ^(UIView *view) {
        NSLog(@"update Finish");
    };
    NSString *url = [NSString stringWithFormat:@"file://%@/index.js",[NSBundle mainBundle].bundlePath];
//      NSString *url = [NSString stringWithFormat:@"file://%@/native-bundle-main.js",[NSBundle mainBundle].bundlePath];
    
    [_instance renderWithURL:[NSURL URLWithString:url] options:@{@"bundleUrl":url} data:nil];
}


- (void)dealloc
{
    [_instance destroyInstance];
}


@end
