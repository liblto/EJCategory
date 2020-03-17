//
//  UIColor+Extension.h
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

/** 随机色 */
+ (UIColor *)random;
/** RGB */
+ (UIColor *)r:(int)r g:(int)g b:(int)b;
/** RGBA. */
+ (UIColor *)r:(int)r g:(int)g b:(int)b alpha:(float)alpha;
/**
 Hex的16进制转颜色
 @param hexCode 十六进制
 @return 颜色
 */
+ (UIColor *)colorHex:(NSString *)hexCode;
+ (UIColor *)colorHex:(NSString *)hexCode alpha:(CGFloat)alpha;

@end
