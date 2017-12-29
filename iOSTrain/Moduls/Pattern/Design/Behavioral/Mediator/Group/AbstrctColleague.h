//
//  AbstrctColleague.h
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AbstrctColleague;

@protocol ColleagueDelegate <NSObject>

// 跟colleague对象的交互
- (void)colleagueEvent:(AbstrctColleague *)event;

@end

@interface AbstrctColleague : NSObject

@property (nonatomic, weak) id<ColleagueDelegate> delegate;

@end
