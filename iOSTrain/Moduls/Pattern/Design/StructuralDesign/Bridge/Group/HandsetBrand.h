//
//  HandsetBand.h
//  iOSTrain
//
//  Created by binyu on 2017/12/6.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYObject.h"
#import "HandsetSoft.h"

@interface HandsetBrand : BYObject

@property(nonatomic,strong) HandsetSoft *soft;

- (void)run;

@end
