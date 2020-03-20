//
//  UIView+Layout.h
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)

#define SCREEN_WITHOUT_STATUS_HEIGHT (SCREEN_HEIGHT - [[UIApplication sharedApplication] statusBarFrame].size.height)

#define kHPercentage(a) (SCREEN_HEIGHT*((a)/667.00))
#define kWPercentage(a) (SCREEN_WIDTH *((a)/375.00))


@interface UIView (LayoutMethods)

@property (nonatomic, assign) CGFloat js_x;
@property (nonatomic, assign) CGFloat js_y;
@property (nonatomic, assign) CGFloat js_width;
@property (nonatomic, assign) CGFloat js_height;

@property (nonatomic, assign) CGFloat js_centerX;
@property (nonatomic, assign) CGFloat js_centerY;
@property (nonatomic, assign) CGPoint js_origin;
@property (nonatomic, assign) CGSize js_size;

@property (nonatomic, readonly) CGFloat js_top;
@property (nonatomic, readonly) CGFloat js_left;
@property (nonatomic, readonly) CGFloat js_bottom;
@property (nonatomic, readonly) CGFloat js_right;

#pragma mark - Imbueset
- (void)fillWidth;
- (void)fillHeight;
- (void)fill;

#pragma mark - SafeArea
- (CGFloat)safeAreaBottomGap;
- (CGFloat)safeAreaTopGap;
- (CGFloat)safeAreaLeftGap;
- (CGFloat)safeAreaRightGap;

#pragma mark - UIViewAutoresizing
- (void)js_makeLeftAndRightAutoresizing;
- (void)js_makeTopAndBottomAutoresizing;
- (void)js_makeWidthAndHeightAutoresizing;
- (void)js_makeAroundAutoresizing;

#pragma mark - Extension
- (UIView *)topSuperView;
- (UIViewController *)superViewController;

@end
