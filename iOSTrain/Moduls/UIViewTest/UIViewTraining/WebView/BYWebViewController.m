//
//  BYWebViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/10/28.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYWebViewController.h"
#import "BYWebPramaWrapper.h"
#import<WebKit/WebKit.h>

@interface BYWebViewController ()<WKNavigationDelegate>

@property (nonatomic,strong) WKWebView *wkWebView;

@end

@implementation BYWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.wkWebView];
    
    self.wkWebView.navigationDelegate = self;
    [self loadURLRequest];
}

- (void)loadURLRequest{
    NSURL *url = [NSURL URLWithString:self.wrapper.url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
   WKNavigation *wkNav =   [self.wkWebView loadRequest:request];
    

}



- (WKWebView *)wkWebView{
    if (!_wkWebView) {
        WKWebViewConfiguration *config = [WKWebViewConfiguration new];
        //初始化偏好设置属性：preferences
        config.preferences = [WKPreferences new];
        //The minimum font size in points default is 0;
        config.preferences.minimumFontSize = 10;
        //是否支持JavaScript
        config.preferences.javaScriptEnabled = YES;
        //不通过用户交互，是否可以打开窗口
        config.preferences.javaScriptCanOpenWindowsAutomatically = NO;
        
        _wkWebView =[[WKWebView alloc] initWithFrame:self.view.frame configuration:config];
    }
    return _wkWebView;
}

#pragma -mark WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"%@",navigation);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"didFinishNavigation=%@",navigation);
}


- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"didFailProvisionalNavigation=%@,error=%@",navigation,error);
}


- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation{
      NSLog(@"didCommitNavigation=%@",navigation);
}




@end
