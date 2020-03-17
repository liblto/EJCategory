//
//  UIDevice+Extension.h
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (Extension)

/** 机型 .*/
+ (NSString *)machineType;
/** 系统版本号 .*/
+ (double)systemVersion;
/** 当前设备电量. */
+ (int)currentBatteryLevel;
/** 是否是iPad .*/
- (BOOL)isPad;
/** 是否是模拟器环境 .*/
- (BOOL)isSimulator;

@end

NS_ASSUME_NONNULL_END

#ifndef kSystemVersion
#define kSystemVersion [UIDevice systemVersion]
#endif

#ifndef kiOS8Later
#define kiOS8Later (kSystemVersion >= 8)
#endif

#ifndef kiOS9Later
#define kiOS9Later (kSystemVersion >= 9)
#endif

#ifndef kiOS10Later
#define kiOS10Later (kSystemVersion >= 10)
#endif
