//
//  UIScreen+Extension.m
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import "UIScreen+Extension.h"

@implementation UIScreen (Extension)

+ (float)screenWidth {
    static CGFloat width = 0.0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
            if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
                width = [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale;
            } else {
                width = [UIScreen mainScreen].bounds.size.height;
            }
        } else {
            if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
                width = [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale;
            } else {
                width = [UIScreen mainScreen].bounds.size.width;
            }
        }
    });
    return width;
}
+ (float)screenHeight {
    static CGFloat heigth = 0.0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
            if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
                if ([UIApplication sharedApplication].statusBarFrame.size.width > 20) {
                    heigth = [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale - 20;
                }
                heigth = [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale;
            } else {
                if ([UIApplication sharedApplication].statusBarFrame.size.width > 20) {
                    heigth = [UIScreen mainScreen].bounds.size.width - 20;
                }
                heigth = [UIScreen mainScreen].bounds.size.width;
            }
        } else {
            if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
                if ([UIApplication sharedApplication].statusBarFrame.size.height > 20) {
                    heigth = [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale - 20;
                }
                heigth = [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale;
            } else {
                if ([UIApplication sharedApplication].statusBarFrame.size.height > 20) {
                    heigth = [UIScreen mainScreen].bounds.size.height - 20;
                }
                heigth = [UIScreen mainScreen].bounds.size.height;
            }
        }
    });
    return heigth;
}
+ (BOOL)isRetina {
    static BOOL isRetina;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isRetina = [[UIDevice currentDevice].systemVersion floatValue] >= 8.0 ? ([UIScreen mainScreen].nativeScale >= 2) : ([UIScreen mainScreen].scale >= 2);
    });
    return isRetina;
}
+ (float)scale {
    static CGFloat screenScale = 0.0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if ([NSThread isMainThread]) {
            screenScale = [[UIDevice currentDevice].systemVersion floatValue] >= 8.0 ? [UIScreen mainScreen].nativeScale : [UIScreen mainScreen].scale;
        } else {
            dispatch_sync(dispatch_get_main_queue(), ^{
                screenScale = [[UIDevice currentDevice].systemVersion floatValue] >= 8.0 ? [UIScreen mainScreen].nativeScale : [UIScreen mainScreen].scale;
            });
        }
    });
    return screenScale;
}
@end
