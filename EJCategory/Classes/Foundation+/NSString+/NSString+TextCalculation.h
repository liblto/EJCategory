//
//  NSString+TextCalculation.h
//  EJBasicTools
//
//  Created by Neo on 2018/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//  传入字体/字体大小/字典得到文字相应的宽度或者高度

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSString (TextCalculation)

/// 传入font数值计算文字宽度
- (CGFloat)getStringWidthWithFontSize:(CGFloat)fontSize;

/// 传入font数值计算文字高度
- (CGFloat)getStringHeightWithFontSize:(CGFloat)fontSize;

/// 传入font计算文字rect的Size
- (CGRect)getStringRectWithFontSize:(CGFloat)fontSize;

/// 传入attribute计算文字rect的Size
- (CGRect)getRectWithStringAttribute:(NSDictionary <NSString *, id> *)attribute;

@end
