//
//  ShapeMaker.m
//  iOSTrain
//
//  Created by binyu on 2017/12/26.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "ShapeMaker.h"
#import "Rectangle.h"
#import "Square.h"
#import "Circle.h"

@interface ShapeMaker()

@property (nonatomic,strong) Rectangle *rectangle;
@property (nonatomic,strong) Square *square;
@property (nonatomic,strong) Circle *circle;

@end

@implementation ShapeMaker

- (instancetype)init{
    self =  [super init];
    if (self) {
        self.rectangle  = [[Rectangle alloc] init];
        self.square  = [[Square alloc] init];
        self.circle  = [[Circle alloc] init];
    }
    return self;
    
}

- (void)drawRectangle{
    [self.rectangle draw];
}

- (void)drawSquare{
    [self.square draw];
}

- (void)drawCircle{
    [self.circle draw];
}

@end
