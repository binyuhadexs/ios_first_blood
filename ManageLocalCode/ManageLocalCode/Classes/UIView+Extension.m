
#import "UIView+Extension.h"

@implementation UIView (Extension)
- (instancetype)roundness
{
    return [self roundedHeadByBorderWidth:0 borderColor:nil];
}
- (instancetype)roundedHeadByBorderWidth:(CGFloat)width borderColor:(UIColor *)color {
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius  = self.width * 0.5;
    if (width)
    {
        self.layer.borderWidth = width;
    }
    if (color)
    {
        self.layer.borderColor = color.CGColor;
    }
    return self;
}
- (void)setCornerRadius:(CGFloat)radius {
    self.layer.masksToBounds= YES;
    self.layer.cornerRadius = radius;
}
- (void)setX:(CGFloat)x
{
    CGRect frame   = self.frame;
    frame.origin.x = x;
    self.frame     = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame   = self.frame;
    frame.origin.y = y;
    self.frame     = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}
- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x       = centerX;
    self.center    = center;
    
}
- (CGFloat)centerX {
    
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y       = centerY;
    self.center    = center;
    
}
- (CGFloat)centerY {
    
    return self.center.y;
}
- (void)setWidth:(CGFloat)width
{
    CGRect frame     = self.frame;
    frame.size.width = width;
    self.frame       = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame      = self.frame;
    frame.size.height = height;
    self.frame        = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size   = size;
    self.frame   = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame   = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (UIImage *)screenshot {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    
    // IOS7及其后续版本
    if ([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:
                                    [self methodSignatureForSelector:
                                     @selector(drawViewHierarchyInRect:afterScreenUpdates:)]];
        [invocation setTarget:self];
        [invocation setSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)];
        CGRect arg2 = self.bounds;
        BOOL arg3 = YES;
        [invocation setArgument:&arg2 atIndex:2];
        [invocation setArgument:&arg3 atIndex:3];
        [invocation invoke];
    } else { // IOS7之前的版本
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenshot;
}

@end
