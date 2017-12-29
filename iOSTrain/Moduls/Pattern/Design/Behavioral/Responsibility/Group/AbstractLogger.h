//
//  AbstractLogger.h
//  iOSTrain
//
//  Created by binyu on 2017/12/19.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,Level){
    LevelConsole = 1,
    LevelError =2,
    LevelFile =3
};

@interface AbstractLogger : NSObject

//下一个
@property (nonatomic,assign) Level level;
@property (nonatomic,strong) AbstractLogger *nextLogger;

- (void)logMessage:(NSString *)message level:(Level)level;
//{
//    if(this.level <= level){
//        write(message);
//    }
//    if(nextLogger !=null){
//        nextLogger.logMessage(level, message);
//    }
//}

-(void)write:(NSString *)message;

@end
