//
//  TargeyProtocol.h
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol TargeyProtocol <NSObject>

- (UIColor *)smallViewColor; /**< 颜色 */

- (NSString *)userName; /**< 用户名 */

- (NSString *)password; /**< 密码 */

@end
