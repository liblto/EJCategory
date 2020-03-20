//
//  NSString+TextCalculation.m
//  EJBasicTools
//
//  Created by Neo on 2018/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import "NSString+TextCalculation.h"

@implementation NSString (TextCalculation)


- (CGFloat)getStringWidthWithFontSize:(CGFloat)fontSize {
    return [self getRectWithStringAttribute:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]}].size.width;
}

- (CGFloat)getStringHeightWithFontSize:(CGFloat)fontSize {
    return [self getRectWithStringAttribute:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]}].size.height;
}

- (CGRect)getStringRectWithFontSize:(CGFloat)fontSize {
    return [self getRectWithStringAttribute:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]}];
}

- (CGRect)getRectWithStringAttribute:(NSDictionary <NSString *, id> *)attribute {
    NSParameterAssert(attribute);
    CGRect rect = CGRectZero;
    if (self.length) {
        rect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, 0)  options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil];
    }
    return rect;
}
@end
