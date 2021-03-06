//
//  UIView+Appearance.h
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Appearance)
/**
 设置部分圆角(绝对布局)

 @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 @param radii 需要设置的圆角大小
 */
- (void)js_setRoundedCorners:(UIRectCorner)corners radii:(CGFloat)radii;

/**
 设置部分圆角(相对布局)

 @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 @param radii 需要设置的圆角大小
 @param rect 需要设置的圆角view的rect
 */
- (void)js_setRoundedCorners:(UIRectCorner)corners radii:(CGFloat)radii viewRect:(CGRect)rect;

/**
 设置部分圆角(绝对布局)，增加设置边框可选项，边框全部默认为1
 
 @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 @param radii 需要设置的圆角大小
 @param borderColor 边框线颜色
 @param width 边框线宽
 */
- (void)js_setRoundedCorners:(UIRectCorner)corners radii:(CGFloat)radii borderColor:(UIColor *)borderColor width:(CGFloat )width;
/**
 设置边框，不带圆角

 @param borderColor 边框线颜色
 @param width 边框线宽
 */
- (void)js_setBorderColor:(UIColor *)borderColor width:(CGFloat)width;

/**
 设置阴影

 @param shadowColor 阴影颜色
 @param offset 阴影偏移方向
 @param opacity 阴影透明度
 @param radius 阴影圆角
 */
- (void)js_setShadowPathWithColor:(UIColor *)shadowColor offset:(CGSize)offset opacity:(CGFloat )opacity radius:(CGFloat )radius;


@end
