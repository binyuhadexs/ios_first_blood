//
//  StudentModel.m
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "StudentModel.h"

@implementation StudentModel

- (void)copyOperationWithObject:(StudentModel *)object {
    object.name = self.name;
    object.age = self.age;
}

- (id)clone {
    StudentModel *student = [[[self class] alloc] init];
    student.name = self.name;
    student.age = self.age;
//    student.address = self.address;
//    student.totalScore = self.totalScore;
    return student;
}

@end
