//
//  UIFont+Layout.m
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import "UIFont+Layout.h"
#import <objc/runtime.h>

@implementation UIFont (Layout)

+ (void)load {
    Method newMethod = class_getClassMethod([self class], @selector(js_adjustFontOfSize:));
    Method method = class_getClassMethod([self class], @selector(systemFontOfSize:));
    method_exchangeImplementations(newMethod, method);
}

+ (UIFont *)js_adjustFontOfSize:(CGFloat)fontSize {
    UIFont *newFont = [UIFont js_adjustFontOfSize:fontSize * [UIScreen mainScreen].bounds.size.width/375];
    return newFont;
}

@end
