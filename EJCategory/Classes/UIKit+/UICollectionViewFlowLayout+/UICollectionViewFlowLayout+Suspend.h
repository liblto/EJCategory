//
//  UICollectionViewFlowLayout+Suspend.h
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewFlowLayout (Suspend)

/** 头部悬浮效果，默认为NO,不悬浮. */
@property (assign , nonatomic) BOOL sectionHeadersPinToVisibleBoundsAll;

@end

NS_ASSUME_NONNULL_END
