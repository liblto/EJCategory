//
//  UIColor+Extension.m
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (UIColor *)random {
    return [UIColor colorWithRed:arc4random()%255/255.f green:arc4random()%255/255.f blue:arc4random()%255/255.f alpha:1];
}

+ (UIColor *)r:(int)r g:(int)g b:(int)b {
    return [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1];
}

+ (UIColor *)r:(int)r g:(int)g b:(int)b alpha:(float)alpha {
    return [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:alpha];
}

+ (UIColor *)colorHex:(NSString *)hexCode {
    NSString *cleanString = [hexCode stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)colorHex:(NSString *)hexCode alpha:(CGFloat)alpha {
    return [[self colorHex:hexCode] colorWithAlphaComponent:alpha];
}

@end
