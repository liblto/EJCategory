//
//  UIViewController+Extension.h
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Extension)

/** statusBar高度. */
@property (nonatomic, assign, readonly) CGFloat js_statusBarHeight;
/** navBar高度. */
@property (nonatomic, assign, readonly) CGFloat js_navBarHeight;
/** statusBar + navBar高度. */
@property (nonatomic, assign, readonly) CGFloat js_topBarTotalHeight;
/** tabBar高度. */
@property (nonatomic, assign, readonly) CGFloat js_tabBarHeight;

- (UIViewController *)currentViewController;

@end

NS_ASSUME_NONNULL_END
