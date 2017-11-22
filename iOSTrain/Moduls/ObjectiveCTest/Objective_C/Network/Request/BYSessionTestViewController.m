//
//  BYSessionTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/18.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYSessionTestViewController.h"

@interface BYSessionTestViewController ()

@property(nonatomic,strong)NSURLSession *session;
@property(nonatomic,strong)NSURLSessionDownloadTask *downloadTask;


@end

@implementation BYSessionTestViewController

- (NSURLSession *)sestion{
    if (!_session) {
        //config 提供了一个全局的网络环境配置,包括:身份验证,浏览器类型,cookie,缓存,超时...
        NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
        /*
         队列: 设置回调的代理方法在哪里执行!!
         - 代理的队列 如果给 nil 哥么在 多个线程执行
         - [NSOperationQueue mainQueue] 主队列
         */
        /*
         The session object keeps a strong reference to the delegate
         Session 会对代理进行强引用!!如果任务执行结束后,不取消session,会出现内存泄露!!
         
         
         真正的网络访问!
         - 在网络开发中,应该讲所有的网络访问操作,封装到一个方法中,由一个统一的单例对象来负责素有的网络事件!
         - Session对代理(单例)进行强引用!单例本身就是一个静态的实例,本身就不需要释放!!
         - AFN -> 需要建立一个AFN 的Manager
         */
        
        _session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
        
    }
    return _session;
}

- (void)startDownloadTask{
    NSURLRequest *requst = [NSURLRequest requestWithURL:[NSURL URLWithString:@""]];
    self.downloadTask  =   [self.session downloadTaskWithRequest:requst];
    [_downloadTask resume];
}

- (void)pause{
    [self.downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        //TODO
        //释放下载任务
        // - 让我们tast设置为week 就可以不用释放了!
        // - 因为任务都是由Session发起的!!而Session对发起的任务都会持有一个强引用!
         self.downloadTask = nil;
    }];
}

-(void)restart{
    //DATA;
   self.downloadTask = [self.session downloadTaskWithResumeData:nil];
     [_downloadTask resume];
}


//1. 下载完成方法
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    NSLog(@"完成 %@",location);
}


//2.下载进度
/**
 1.session
 2.downloadTask                 调用代理方式的的下载任务!
 3.bytesWritten                 本次下载的字节数!
 4,totalBytesWritten            已经下载的字节数!
 5,totalBytesExpectedToWrite    期望下载的字节数-->文件总大小!
 */
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    float progress = (float) totalBytesWritten / totalBytesExpectedToWrite;
    NSLog(@"%f %@",progress,[NSThread currentThread]);

}


//3.下载续传数据
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes
{
    
}


/**
 参数:
 
 Challenge :询问,询问客户端是否需要信任来自服务器的证书!
 属性:protectionSpace(受保护的空间)
 Auth-Scheme:NSURLAuthenticationMethodServerTrust  服务器返回的授权模式:要求信任服务器的证书
 
 completionHandler : 通过代码块回调,决定对证书的处理!!
 
 
 
 
 
 NSURLSessionAuthChallengeDisposition (处置):
 NSURLSessionAuthChallengeUseCredential
 -  使用服务器发回证书(保存在challenge里面)
 NSURLSessionAuthChallengePerformDefaultHandling
 -  默认处理方式,会忽略证书
 NSURLSessionAuthChallengeCancelAuthenticationChallenge
 -  取消整个请求,忽略证书
 NSURLSessionAuthChallengeRejectProtectionSpace
 -  本次拒绝,下次再试
 
 NSURLCredential   证书
 */
-(void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler
{
    //1.判断服务器的身份验证的方法是否是:信任服务器证书
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        NSLog(@"是信任的证书");
        //2.获得证书
        NSURLCredential * credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
        //3.对服务器的证书做出"处理"
        completionHandler(NSURLSessionAuthChallengeUseCredential,credential);
    }
    
}

-(void)putUpload{
    //1.url - URL是直接保存在服务器上的文件名
    NSURL * url = [NSURL URLWithString:@"///"];
    //2.请求
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    //设置请求方法-webdav上传需要使用put方法
    request.HTTPMethod = @"PUT";
    //设置身份验证的数据
    NSString * authStr = [self base64Encode:@"admin:123456"];
    authStr = [@"BASIC " stringByAppendingString:authStr];
    //设置请求头
    [request setValue:authStr forHTTPHeaderField:@"Authorization"];
    
    //3.session
    //上传的源文件的路径!!
    NSURL * fileUrl = [[NSBundle mainBundle] URLForResource:@"456.png" withExtension:nil];
    
    [[[NSURLSession sharedSession] uploadTaskWithRequest:request fromFile:fileUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSString * str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@ %@",str,response);
        
    }] resume];
    
    
    
}


-(NSString *)base64Encode:(NSString *)str{
    //1.转成二进制
    NSData * data = [str dataUsingEncoding:NSUTF8StringEncoding];
    //2.base64编码
    return [data base64EncodedStringWithOptions:0];
    
}


@end
