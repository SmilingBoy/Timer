/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 3.0 Edition
 BSD License, Use at your own risk
 */

#import <UIKit/UIKit.h>

CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (ViewFrameGeometry)
@property CGPoint origin;//起点:左上角点
@property CGSize size;//尺寸

@property (readonly) CGPoint bottomLeft;//左下角点
@property (readonly) CGPoint bottomRight;//右下角点
@property (readonly) CGPoint topRight;//右上角点

@property CGFloat height;//高度
@property CGFloat width;//宽度

@property CGFloat top;//顶端Y坐标
@property CGFloat left;//左边X坐标

@property CGFloat bottom;//底边Y坐标
@property CGFloat right;//右边X坐标

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;
@end