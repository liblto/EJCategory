//
//  UIButton+Custom.h
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Custom)

/** 针对同时设置了Image和Title的场景时UIButton中的图片和文字的关系. */
typedef NS_ENUM(NSInteger, UIButtonImageTitleStyle) {
    UIButtonImageTitleStyleDefault        = 0,    /**< 图片在左，文字在右，整体居中. */
    UIButtonImageTitleStyleLeft           = 0,    /**< 图片在左，文字在右，整体居中. */
    UIButtonImageTitleStyleRight          = 2,    /**< 图片在右，文字在左，整体居中. */
    UIButtonImageTitleStyleTop            = 3,    /**< 图片在上，文字在下，整体居中. */
    UIButtonImageTitleStyleBottom         = 4,    /**< 图片在下，文字在上，整体居中. */
    UIButtonImageTitleStyleCenterTop      = 5,    /**< 图片居中，文字在上距离按钮顶部. */
    UIButtonImageTitleStyleCenterBottom   = 6,    /**< 图片居中，文字在下距离按钮底部. */
    UIButtonImageTitleStyleCenterUp       = 7,    /**< 图片居中，文字在图片上面. */
    UIButtonImageTitleStyleCenterDown     = 8,    /**< 图片居中，文字在图片下面. */
    UIButtonImageTitleStyleRightLeft      = 9,    /**< 图片在右，文字在左，距离按钮两边边距. */
    UIButtonImageTitleStyleLeftRight      = 10,   /**< 图片在左，文字在右，距离按钮两边边距. */
};

/**
 调整按钮的文本和image的布局，前提是title和image同时存在才会调整
 
 @param style 排列的枚举类型
 @param space 调整布局时整个按钮和图文的间隔
 */
- (void)setImageTitleStyle:(UIButtonImageTitleStyle)style space:(CGFloat)space;

@end
