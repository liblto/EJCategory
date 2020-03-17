//
//  UIViewController+Extension.m
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

#pragma mark - 获取相关控件的实际高度

- (CGFloat)js_statusBarHeight {
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}

- (CGFloat)js_navBarHeight {
    return self.navigationController.navigationBar.frame.size.height;
}

- (CGFloat)js_topBarTotalHeight {
    return self.js_statusBarHeight + self.js_navBarHeight;
}

- (CGFloat)js_tabBarHeight {
    return self.tabBarController.tabBar.frame.size.height;
}
// 获取到当前所在的视图
- (UIViewController *)currentViewController {
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal){
                window = tmpWin;
                break;
            }
        }
    }
    UIViewController *result = window.rootViewController;
    while (result.presentedViewController) {
        result = result.presentedViewController;
    }
    if ([result isKindOfClass:[UITabBarController class]]) {
        result = [(UITabBarController *)result selectedViewController];
    }
    if ([result isKindOfClass:[UINavigationController class]]) {
        result = [(UINavigationController *)result topViewController];
    }
    return result;
}
@end
