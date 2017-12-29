//
//  ShapeFactory.h
//  iOSTrain
//
//  Created by binyu on 2017/12/6.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYObject.h"
#import "BYShape.h"
#import "Rectangle.h"
#import "Square.h"
#import "Circle.h"

typedef NS_ENUM(NSInteger,ShapeType) {
    kRectangle,
    kSquare,
    kCircle
};

@interface ShapeFactory : BYObject

+ (BYShape *)shapeFactory:(ShapeType)type;

+ (BYShape *)createShape:(NSString *)clazz;

@end
