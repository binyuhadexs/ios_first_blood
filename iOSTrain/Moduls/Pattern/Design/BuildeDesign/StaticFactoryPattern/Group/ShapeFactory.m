//
//  ShapeFactory.m
//  iOSTrain
//
//  Created by binyu on 2017/12/6.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "ShapeFactory.h"


@implementation ShapeFactory

+ (BYShape *)shapeFactory:(ShapeType)type{
    BYShape *shape;
    switch (type) {
        case kRectangle:
            shape = [[Rectangle alloc] init];
            //
            break;
        case kSquare:
             shape = [[Square alloc] init];
            break;
        case kCircle:
             shape = [[Circle alloc] init];
            break;
    }
    
    return shape;
}

//TODO
+ (BYShape *)createShape:(NSString *)clazz{
    BYShape *shape;
     Class class = NSClassFromString(clazz);
    shape =  [[class alloc] init];
    return shape;
}

@end
