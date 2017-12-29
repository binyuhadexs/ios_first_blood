//
//  File.m
//  iOSTrain
//
//  Created by binyu on 2017/12/19.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "File.h"

@implementation File

- (void)addFile:(File *)file{
    if (!_childFiles) {
        _childFiles = [NSMutableArray array];
    }
    [_childFiles addObject:file];
}


+ (instancetype)fileWithFileType:(EFile)type fileName:(NSString *)name{
    File *file = [File new];
    file.name = name;
    file.fileType = type;
    return file;
}

@end
