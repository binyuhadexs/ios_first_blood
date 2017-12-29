//
//  ColorViewAdapter.h
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TargeyProtocol.h"
#import "NewVCModel.h"

@interface ColorViewAdapter : NSObject<TargeyProtocol>

@property (nonatomic, strong) id model; /**< 输入的模型数据 */

- (instancetype)initWithModel:(id)model; /**< 初始化的一个方法 */

@end
