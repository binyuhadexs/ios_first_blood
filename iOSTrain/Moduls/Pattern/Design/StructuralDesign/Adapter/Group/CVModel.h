//
//  CVModel.h
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CVModel : NSObject

@property (nonatomic, strong) UIColor *smallViewColor; /**< 颜色 */
@property (nonatomic, copy) NSString *userName; /**< 用户名 */
@property (nonatomic, copy) NSString *password; /**< 密码 */

@end
