//
//  BYKVCModel.h
//  iOSTrain
//
//  Created by binyu on 2017/11/23.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYObject.h"

@interface BYKVCModel : BYObject

@property (nonatomic,copy,setter=setMame:,getter=getMame)  NSString *name;

@property (nonatomic,assign)  BOOL up;

@property (nonatomic,strong)  BYKVCModel *mode;

@end
