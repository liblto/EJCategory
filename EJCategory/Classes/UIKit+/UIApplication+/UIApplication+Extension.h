//
//  UIApplication+Extension.h
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (Extension)

+ (NSURL *)documentsURL;
+ (NSURL *)cachesURL;
+ (NSURL *)libraryURL;
+ (NSString *)documentsPath;
+ (NSString *)cachesPath;
+ (NSString *)libraryPath;
+ (NSString *)displayName;
+ (NSString *)bundleName;
+ (NSString *)bundleID;
+ (NSString *)appVersion;
+ (NSString *)buildVersion;
+ (NSString *)currentLanguage;
- (BOOL)fileExistInMainBundle:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
