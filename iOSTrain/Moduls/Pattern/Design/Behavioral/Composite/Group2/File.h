//
//  File.h
//  iOSTrain
//
//  Created by binyu on 2017/12/19.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    kFile,
    kFolder,
}EFile ;

@interface File : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger size;
@property (nonatomic,assign) EFile fileType;

@property (nonatomic,strong) NSMutableArray<File *> *childFiles;

- (void)addFile:(File *)file;
+ (instancetype)fileWithFileType:(EFile)type fileName:(NSString *)name;




@end
