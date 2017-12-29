//
//  ClassModel.h
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BaseCopyObject.h"
#import "StudentModel.h"

@interface ClassModel : BaseCopyObject

@property (nonatomic, copy) NSString *className;
@property (nonatomic, copy) NSArray<StudentModel *> *students;


@end
