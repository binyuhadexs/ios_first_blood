//
//  Receiver.h
//  iOSTrain
//
//  Created by binyu on 2017/12/25.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Receiver : NSObject
{
    CGFloat _white;  // 白的
    CGFloat _alpha;  // 透明度
}

// 接收者的view
@property (nonatomic, strong) UIView *receiverView;

// 变暗的接口
- (void)mackeDarker:(CGFloat)pamameter;

// 变亮的接口
- (void)mackeLighter:(CGFloat)pamameter;


@end
