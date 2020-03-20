//
//  UIView+Layout.m
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import "UIView+Layout.h"
#import <objc/runtime.h>

static void *kUIViewLayoutMethodPropertyBottomGap = &kUIViewLayoutMethodPropertyBottomGap;
static void *kUIViewLayoutMethodPropertyTopGap = &kUIViewLayoutMethodPropertyTopGap;
static void *kUIViewLayoutMethodPropertyLeftGap = &kUIViewLayoutMethodPropertyLeftGap;
static void *kUIViewLayoutMethodPropertyRightGap = &kUIViewLayoutMethodPropertyRightGap;


@implementation UIView (LayoutMethods)

- (CGFloat)js_x {
    return self.frame.origin.x;
}

- (void)setJs_x:(CGFloat)x {
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)js_y {
    return self.frame.origin.y;
}

- (void)setJs_y:(CGFloat)y {
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)js_width {
    return self.frame.size.width;
}

- (void)setJs_width:(CGFloat)width {
    CGRect newFrame = CGRectMake(self.js_x, self.js_y, width, self.js_height);
    self.frame = newFrame;
}

- (CGFloat)js_height {
    return self.frame.size.height;
}

- (void)setJs_height:(CGFloat)height {
    CGRect newFrame = CGRectMake(self.js_x, self.js_y, self.js_width, height);
    self.frame = newFrame;
}

- (CGFloat)js_centerX {
    return self.center.x;
}

- (void)setJs_centerX:(CGFloat)centerX {
    CGPoint center = CGPointMake(self.js_centerX, self.js_centerY);
    center.x = centerX;
    self.center = center;
}

- (CGFloat)js_centerY {
    return self.center.y;
}

- (void)setJs_centerY:(CGFloat)centerY {
    CGPoint center = CGPointMake(self.js_centerX, self.js_centerY);
    center.y = centerY;
    self.center = center;
}

- (CGPoint)js_origin {
    return self.frame.origin;
}

- (void)setJs_origin:(CGPoint)origin {
    self.frame = CGRectMake(origin.x, origin.y, self.js_width, self.js_height);
}

- (CGSize)js_size {
    return self.frame.size;
}

- (void)setJs_size:(CGSize)size {
    self.frame = CGRectMake(self.js_x, self.js_y, size.width, size.height);
}

- (CGFloat)js_top {
    return self.frame.origin.y;
}

- (CGFloat)js_left {
    return self.frame.origin.x;
}

- (CGFloat)js_bottom {
    return self.frame.size.height + self.frame.origin.y;
}

- (CGFloat)js_right {
    return self.frame.size.width + self.frame.origin.x;
}

#pragma mark - SafeArea
- (CGFloat)safeAreaBottomGap {
    NSNumber *gap = objc_getAssociatedObject(self, kUIViewLayoutMethodPropertyBottomGap);
    if (gap == nil) {
        if (@available(iOS 11, *)) {
			if (self.superview.safeAreaLayoutGuide.layoutFrame.size.height > 0) {
                gap = @((self.superview.js_height - self.superview.safeAreaLayoutGuide.layoutFrame.origin.y - self.superview.safeAreaLayoutGuide.layoutFrame.size.height));
            } else {
                gap = nil;
            }
        } else {
            gap = @(0);
        }
        objc_setAssociatedObject(self, kUIViewLayoutMethodPropertyBottomGap, gap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return gap.floatValue;
}

- (CGFloat)safeAreaTopGap {
    NSNumber *gap = objc_getAssociatedObject(self, kUIViewLayoutMethodPropertyTopGap);
    if (gap == nil) {
        if (@available(iOS 11, *)) {
            gap = @(self.superview.safeAreaLayoutGuide.layoutFrame.origin.y);
        } else {
            gap = @(0);
        }
        objc_setAssociatedObject(self, kUIViewLayoutMethodPropertyTopGap, gap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return gap.floatValue;
}

- (CGFloat)safeAreaLeftGap {
    NSNumber *gap = objc_getAssociatedObject(self, kUIViewLayoutMethodPropertyLeftGap);
    if (gap == nil) {
        if (@available(iOS 11, *)) {
            gap = @(self.superview.safeAreaLayoutGuide.layoutFrame.origin.x);
        } else {
            gap = @(0);
        }
        objc_setAssociatedObject(self, kUIViewLayoutMethodPropertyLeftGap, gap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return gap.floatValue;
}

- (CGFloat)safeAreaRightGap {
    NSNumber *gap = objc_getAssociatedObject(self, kUIViewLayoutMethodPropertyRightGap);
    if (gap == nil) {
        if (@available(iOS 11, *)) {
            gap = @(self.superview.safeAreaLayoutGuide.layoutFrame.origin.x);
        } else {
            gap = @(0);
        }
        objc_setAssociatedObject(self, kUIViewLayoutMethodPropertyRightGap, gap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return gap.floatValue;
}


#pragma mark - UIViewAutoresizing

- (void)js_makeLeftAndRightAutoresizing {
    self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
}

- (void)js_makeTopAndBottomAutoresizing {
    self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
}

- (void)js_makeAroundAutoresizing{
    self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin| UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
}

- (void)js_makeWidthAndHeightAutoresizing{
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

#pragma mark - Extension

- (UIView *)topSuperView {
    UIView *topSuperView = self.superview;
    
    if (topSuperView == nil) {
        topSuperView = self;
    } else {
        while (topSuperView.superview) {
            topSuperView = topSuperView.superview;
        }
    }
    
    return topSuperView;
}

- (UIViewController *)superViewController {
    UIResponder *responder = self;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
    return nil;
}


#pragma mark - Test

- (UIView *(^)(UIColor *color))setColor {
    return ^ (UIColor *color) {
        self.backgroundColor = color;
        return self;
    };
}

- (UIView *(^)(CGRect frame))setFrame {
    return ^ (CGRect frame) {
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGSize size)) setSize {
    return ^ (CGSize size) {
        self.bounds = CGRectMake(0, 0, size.width, size.height);
        return self;
    };
}

@end
