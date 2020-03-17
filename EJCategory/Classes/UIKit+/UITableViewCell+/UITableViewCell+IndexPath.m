//
//  UITableViewCell+IndexPath.m
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import "UITableViewCell+IndexPath.h"
#import <objc/runtime.h>

static NSString * const kIndexPath = @"kIndexPath";

@implementation UITableViewCell (IndexPath)

- (void)setIndexPath:(NSIndexPath *)indexPath {
    [self willChangeValueForKey:kIndexPath];
    objc_setAssociatedObject(self, &kIndexPath, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:kIndexPath];
}
- (NSIndexPath *)indexPath {
    return objc_getAssociatedObject(self, &kIndexPath);
}

@end


