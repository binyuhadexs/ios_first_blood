//
//  BYKVCModel.m
//  iOSTrain
//
//  Created by binyu on 2017/11/23.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYKVCModel.h"

@implementation BYKVCModel


//- (void)setValue:(id)value forKey:(NSString *)key{
//    NSLog(@"%@",value);
//}
+(void)load{
    NSLog(@"BYKVCModel");
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"value=%@",value);
}

- (BOOL)validateValue:(inout id  _Nullable __autoreleasing *)ioValue forKey:(NSString *)inKey error:(out NSError * _Nullable __autoreleasing *)outError{
    return NO;
}

- (BOOL)validateValue:(inout id  _Nullable __autoreleasing *)ioValue forKeyPath:(NSString *)inKeyPath error:(out NSError * _Nullable __autoreleasing *)outError{
    return NO;
}

//+(BOOL)accessInstanceVariablesDirectly{
//    return NO;
//}

//- (void)setName:(NSString *)name{
//     NSLog(@"setName=%@",name);
//     _name = name;
//}

//  参数类型不是一个对象指针类型,但是值为nil
- (void)setNilValueForKey:(NSString *)key{
     NSLog(@"setNilValueForKey");
}


//- (void)_setName:(NSString *)name{
//    NSLog(@"set_name=%@",name);
//    _name = name;
//}

- (NSString *)_getName{
    NSLog(@"_getName");
    return _name;
}

@end
