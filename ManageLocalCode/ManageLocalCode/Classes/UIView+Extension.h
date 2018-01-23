
#import <UIKit/UIKit.h>

/** 快速集成x,y,width,height等getter setter方法 */
@interface UIView (Extension)

@property (nonatomic, assign) CGFloat x; /**< 直接获取/设置UIView的x属性 */

@property (nonatomic, assign) CGFloat y; /**< 直接获取/设置UIView的y属性 */

@property (nonatomic, assign) CGFloat centerX; /**< 直接获取/设置UIView的中心点的x属性 */

@property (nonatomic, assign) CGFloat centerY; /**< 直接获取/设置UIView的中心点的y属性 */

@property (nonatomic, assign) CGFloat width; /**< 直接获取/设置UIView的width属性 */

@property (nonatomic, assign) CGFloat height; /**< 直接获取/设置UIView的height属性 */

@property (nonatomic, assign) CGSize  size; /**< 直接获取/设置UIView的size属性 */

@property (nonatomic, assign) CGPoint origin; /**< 直接获取/设置UIView的origin属性 */

/** 设置边角 */
- (void)setCornerRadius:(CGFloat)radius;
/** 自身圆形 */
- (instancetype)roundness;

/** 设置一个圆角头像 */
- (instancetype) roundedHeadByBorderWidth:(CGFloat)width borderColor:(UIColor *)color;

/** 针对view屏幕截图,若是全屏控制器view,则是截屏功能 */
- (UIImage *)screenshot;

@end
