//
//  StudentModel.h
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BaseCopyObject.h"
#import "PrototypeCopyProtocol.h"

@interface StudentModel : BaseCopyObject<PrototypeCopyProtocol>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;

@end
