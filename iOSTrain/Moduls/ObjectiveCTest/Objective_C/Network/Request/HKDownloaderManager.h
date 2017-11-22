//
//  HKDownloaderManager.h
//  002--下载管理器
//
//  Created by H on 2017/2/24.
//  Copyright © 2017年 TZ. All rights reserved.
// 负责管理所有的下载任务 -- 单例


#import <Foundation/Foundation.h>

@interface HKDownloaderManager : NSObject

+(instancetype)shareDownloaderManager;

/** 下载 */
-(void)downloadWithURL:(NSURL *)url Progress:(void (^)(float progress))progress completion:(void (^)(NSString * filePath))completion failed:(void (^)(NSString * errorMsg))failed;


/**
 *  暂停下载
 */
-(void)pauserWithURL:(NSURL *)url;


@end
