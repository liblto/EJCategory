//
//  UIScreen+Extension.h
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (Extension)
/** 屏幕物理宽. */
+ (float)screenWidth;
/** 屏幕物理高. */
+ (float)screenHeight;
/** 是否Retina. */
+ (BOOL)isRetina;
/** 缩放因子. */
+ (float)scale;

@end
