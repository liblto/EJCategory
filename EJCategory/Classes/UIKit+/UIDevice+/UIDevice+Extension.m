//
//  UIDevice+Extension.m
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import "UIDevice+Extension.h"
#import <sys/utsname.h>
#import <objc/runtime.h>

@implementation UIDevice (Extension)

+ (NSString *)machineType {
    static NSString *machine;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        struct utsname systemInfo;
        uname(&systemInfo);
        NSString *platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
        if([platform isEqualToString:@"iPhone1,1"])     machine = @"iPhone 2G";
        if([platform isEqualToString:@"iPhone1,2"])     machine = @"iPhone 3G";
        if([platform isEqualToString:@"iPhone2,1"])     machine = @"iPhone 3GS";
        if([platform isEqualToString:@"iPhone3,1"])     machine = @"iPhone 4";
        if([platform isEqualToString:@"iPhone3,2"])     machine = @"iPhone 4";
        if([platform isEqualToString:@"iPhone3,3"])     machine = @"iPhone 4";
        if([platform isEqualToString:@"iPhone4,1"])     machine = @"iPhone 4S";
        if([platform isEqualToString:@"iPhone5,1"])     machine = @"iPhone 5";
        if([platform isEqualToString:@"iPhone5,2"])     machine = @"iPhone 5";
        if([platform isEqualToString:@"iPhone5,3"])     machine = @"iPhone 5c";
        if([platform isEqualToString:@"iPhone5,4"])     machine = @"iPhone 5c";
        if([platform isEqualToString:@"iPhone6,1"])     machine = @"iPhone 5s";
        if([platform isEqualToString:@"iPhone6,2"])     machine = @"iPhone 5s";
        if([platform isEqualToString:@"iPhone7,1"])     machine = @"iPhone 6 Plus";
        if([platform isEqualToString:@"iPhone7,2"])     machine = @"iPhone 6";
        if([platform isEqualToString:@"iPhone8,1"])     machine = @"iPhone 6s";
        if([platform isEqualToString:@"iPhone8,2"])     machine = @"iPhone 6s Plus";
        if([platform isEqualToString:@"iPhone8,4"])     machine = @"iPhone SE";
        if([platform isEqualToString:@"iPhone9,1"])     machine = @"iPhone 7";
        if([platform isEqualToString:@"iPhone9,2"])     machine = @"iPhone 7 Plus";
        if([platform isEqualToString:@"iPhone10,1"])    machine = @"iPhone 8";
        if([platform isEqualToString:@"iPhone10,4"])    machine = @"iPhone 8";
        if([platform isEqualToString:@"iPhone10,2"])    machine = @"iPhone 8 Plus";
        if([platform isEqualToString:@"iPhone10,5"])    machine = @"iPhone 8 Plus";
        if([platform isEqualToString:@"iPhone10,3"])    machine = @"iPhone X";
        if([platform isEqualToString:@"iPhone10,6"])    machine = @"iPhone X";
        if([platform isEqualToString:@"iPod1,1"])       machine = @"iPod Touch 1G";
        if([platform isEqualToString:@"iPod2,1"])       machine = @"iPod Touch 2G";
        if([platform isEqualToString:@"iPod3,1"])       machine = @"iPod Touch 3G";
        if([platform isEqualToString:@"iPod4,1"])       machine = @"iPod Touch 4G";
        if([platform isEqualToString:@"iPod5,1"])       machine = @"iPod Touch 5G";
        if([platform isEqualToString:@"iPad1,1"])       machine = @"iPad 1G";
        if([platform isEqualToString:@"iPad2,1"])       machine = @"iPad 2";
        if([platform isEqualToString:@"iPad2,2"])       machine = @"iPad 2";
        if([platform isEqualToString:@"iPad2,3"])       machine = @"iPad 2";
        if([platform isEqualToString:@"iPad2,4"])       machine = @"iPad 2";
        if([platform isEqualToString:@"iPad2,5"])       machine = @"iPad Mini 1G";
        if([platform isEqualToString:@"iPad2,6"])       machine = @"iPad Mini 1G";
        if([platform isEqualToString:@"iPad2,7"])       machine = @"iPad Mini 1G";
        if([platform isEqualToString:@"iPad3,1"])       machine = @"iPad 3";
        if([platform isEqualToString:@"iPad3,2"])       machine = @"iPad 3";
        if([platform isEqualToString:@"iPad3,3"])       machine = @"iPad 3";
        if([platform isEqualToString:@"iPad3,4"])       machine = @"iPad 4";
        if([platform isEqualToString:@"iPad3,5"])       machine = @"iPad 4";
        if([platform isEqualToString:@"iPad3,6"])       machine = @"iPad 4";
        if([platform isEqualToString:@"iPad4,1"])       machine = @"iPad Air";
        if([platform isEqualToString:@"iPad4,2"])       machine = @"iPad Air";
        if([platform isEqualToString:@"iPad4,3"])       machine = @"iPad Air";
        if([platform isEqualToString:@"iPad4,4"])       machine = @"iPad Mini 2G";
        if([platform isEqualToString:@"iPad4,5"])       machine = @"iPad Mini 2G";
        if([platform isEqualToString:@"iPad4,6"])       machine = @"iPad Mini 2G";
        if([platform isEqualToString:@"iPad4,7"])       machine = @"iPad Mini 3";
        if([platform isEqualToString:@"iPad4,8"])       machine = @"iPad Mini 3";
        if([platform isEqualToString:@"iPad4,9"])       machine = @"iPad Mini 3";
        if([platform isEqualToString:@"iPad5,1"])       machine = @"iPad Mini 4";
        if([platform isEqualToString:@"iPad5,2"])       machine = @"iPad Mini 4";
        if([platform isEqualToString:@"iPad5,3"])       machine = @"iPad Air 2";
        if([platform isEqualToString:@"iPad5,4"])       machine = @"iPad Air 2";
        if([platform isEqualToString:@"iPad6,3"])       machine = @"iPad Pro 9.7";
        if([platform isEqualToString:@"iPad6,4"])       machine = @"iPad Pro 9.7";
        if([platform isEqualToString:@"iPad6,7"])       machine = @"iPad Pro 12.9";
        if([platform isEqualToString:@"iPad6,8"])       machine = @"iPad Pro 12.9";
        if([platform isEqualToString:@"i386"])          machine = @"iPhone Simulator";
        if([platform isEqualToString:@"x86_64"])        machine = @"iPhone Simulator";
    });
    return machine;
}
+ (double)systemVersion {
    static double version;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        version = [UIDevice currentDevice].systemVersion.doubleValue;
    });
    return version;
}
- (BOOL)isPad {
    static BOOL isPad;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
    });
    return isPad;
}
- (BOOL)isSimulator {
#if TARGET_OS_SIMULATOR
    return YES;
#else
    return NO;
#endif
}
+ (int)currentBatteryLevel {
    UIApplication *app = [UIApplication sharedApplication];
    if (app.applicationState == UIApplicationStateActive || app.applicationState==UIApplicationStateInactive) {
        Ivar ivar = class_getInstanceVariable([app class],"_statusBar");
        id status = object_getIvar(app, ivar);
        for (id aview in [status subviews]) {
            int batteryLevel = 0;
            for (id bview in [aview subviews]) {
                if ([NSStringFromClass([bview class]) caseInsensitiveCompare:@"UIStatusBarBatteryItemView"] == NSOrderedSame&&[[[UIDevice currentDevice] systemVersion] floatValue] >=6.0) {
                    Ivar ivar = class_getInstanceVariable([bview class],"_capacity");
                    if (ivar) {
                        batteryLevel = ((int (*)(id, Ivar))object_getIvar)(bview, ivar);
                        if (batteryLevel > 0 && batteryLevel <= 100) {
                            return batteryLevel;
                        } else {
                            return 0;
                        }
                    }
                }
            }
        }
    }
    return 0;
}
@end
