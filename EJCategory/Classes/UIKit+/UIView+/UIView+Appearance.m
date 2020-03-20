//
//  UIView+Appearance.m
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import "UIView+Appearance.h"

@implementation UIView (Appearance)


- (void)js_setRoundedCorners:(UIRectCorner)corners radii:(CGFloat)radii {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radii, radii)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)js_setRoundedCorners:(UIRectCorner)corners radii:(CGFloat)radii viewRect:(CGRect)rect {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:CGSizeMake(radii, radii)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)js_setRoundedCorners:(UIRectCorner)corners radii:(CGFloat)radii borderColor:(UIColor *)borderColor width:(CGFloat )width {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radii, radii)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
    CAShapeLayer *graphicLayer = [CAShapeLayer layer];
    graphicLayer.path = maskPath.CGPath;
    graphicLayer.lineWidth = width;
    graphicLayer.strokeColor = borderColor.CGColor;
    graphicLayer.fillColor = UIColor.clearColor.CGColor;
    [self.layer addSublayer:graphicLayer];
}

- (void)js_setBorderColor:(UIColor *)borderColor width:(CGFloat)width {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRect:self.bounds];
    CAShapeLayer *graphicLayer = [CAShapeLayer layer];
    graphicLayer.path = maskPath.CGPath;
    graphicLayer.lineWidth = 1;
    graphicLayer.strokeColor = borderColor.CGColor;
    graphicLayer.fillColor = UIColor.clearColor.CGColor;
    [self.layer addSublayer:graphicLayer];
}

- (void)js_setShadowPathWithColor:(UIColor *)shadowColor offset:(CGSize)offset opacity:(CGFloat )opacity radius:(CGFloat )radius {
    self.layer.cornerRadius = radius;
    
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = opacity;
    //    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(self.height/2, self.height/2)].CGPath;
}
/*
 clipsToBounds(UIView)
 是指视图上的子视图,如果超出父视图的部分就截取掉,
 masksToBounds(CALayer)
 却是指视图的图层上的子图层,如果超出父图层的部分就截取掉
 clipsToBounds执行的时候,调用了自己涂层的maskToBounds方法
 */
@end
