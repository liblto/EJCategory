//
//  UIButton+Custom.m
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import "UIButton+Custom.h"

@implementation UIButton (Custom)

- (void)setImageTitleStyle:(UIButtonImageTitleStyle)style space:(CGFloat)space {
    if (self.imageView.image != nil && self.titleLabel.text != nil) {
        // 先还原
        self.titleEdgeInsets = UIEdgeInsetsZero;
        self.imageEdgeInsets = UIEdgeInsetsZero;
        
        CGRect imageRect = self.imageView.frame;
        CGRect titleRect = self.titleLabel.frame;
        
        CGFloat totalHeight = imageRect.size.height + space + titleRect.size.height;
        CGFloat selfHeight = self.frame.size.height;
        CGFloat selfWidth = self.frame.size.width;
        
        switch (style) {
            case UIButtonImageTitleStyleLeft: {
                if (space != 0) {
                    self.titleEdgeInsets = UIEdgeInsetsMake(0,
                                                            space/2,
                                                            0,
                                                            -space/2);
                    self.imageEdgeInsets = UIEdgeInsetsMake(0,
                                                            -space/2,
                                                            0,
                                                            space/2);
                }
            } break;
            case UIButtonImageTitleStyleRight: { // 图片在右，文字在左
                self.titleEdgeInsets = UIEdgeInsetsMake(0,
                                                        -(imageRect.size.width + space/2),
                                                        0,
                                                        (imageRect.size.width + space/2));
                
                self.imageEdgeInsets = UIEdgeInsetsMake(0,
                                                        (titleRect.size.width+ space/2),
                                                        0,
                                                        -(titleRect.size.width+ space/2));
            } break;
            case UIButtonImageTitleStyleTop: { // 图片在上，文字在下
                self.titleEdgeInsets = UIEdgeInsetsMake(((selfHeight - totalHeight)/2 + imageRect.size.height + space - titleRect.origin.y),
                                                        (selfWidth/2 - titleRect.origin.x - titleRect.size.width /2) - (selfWidth - titleRect.size.width) / 2,
                                                        -((selfHeight - totalHeight)/2 + imageRect.size.height + space - titleRect.origin.y),
                                                        -(selfWidth/2 - titleRect.origin.x - titleRect.size.width /2) - (selfWidth - titleRect.size.width) / 2);
                
                self.imageEdgeInsets = UIEdgeInsetsMake(((selfHeight - totalHeight)/2 - imageRect.origin.y),
                                                        (selfWidth /2 - imageRect.origin.x - imageRect.size.width / 2),
                                                        -((selfHeight - totalHeight)/2 - imageRect.origin.y),
                                                        -(selfWidth /2 - imageRect.origin.x - imageRect.size.width / 2));
            } break;
            case UIButtonImageTitleStyleBottom: { // 图片在下，文字在上
                self.titleEdgeInsets = UIEdgeInsetsMake(((selfHeight - totalHeight)/2 - titleRect.origin.y),
                                                        (selfWidth/2 - titleRect.origin.x - titleRect.size.width / 2) - (selfWidth - titleRect.size.width) / 2,
                                                        -((selfHeight - totalHeight)/2 - titleRect.origin.y),
                                                        -(selfWidth/2 - titleRect.origin.x - titleRect.size.width / 2) - (selfWidth - titleRect.size.width) / 2);
                self.imageEdgeInsets = UIEdgeInsetsMake(((selfHeight - totalHeight)/2 + titleRect.size.height + space - imageRect.origin.y),
                                                        (selfWidth /2 - imageRect.origin.x - imageRect.size.width / 2),
                                                        -((selfHeight - totalHeight)/2 + titleRect.size.height + space - imageRect.origin.y),
                                                        -(selfWidth /2 - imageRect.origin.x - imageRect.size.width / 2));
            } break;
            case UIButtonImageTitleStyleCenterTop: {
                self.titleEdgeInsets = UIEdgeInsetsMake(-(titleRect.origin.y - space),
                                                        (selfWidth / 2 -  titleRect.origin.x - titleRect.size.width / 2) - (selfWidth - titleRect.size.width) / 2,
                                                        (titleRect.origin.y - space),
                                                        -(selfWidth / 2 -  titleRect.origin.x - titleRect.size.width / 2) - (selfWidth - titleRect.size.width) / 2);
                self.imageEdgeInsets = UIEdgeInsetsMake(0,
                                                        (selfWidth / 2 - imageRect.origin.x - imageRect.size.width / 2),
                                                        0,
                                                        -(selfWidth / 2 - imageRect.origin.x - imageRect.size.width / 2));
            } break;
            case UIButtonImageTitleStyleCenterBottom: {
                self.titleEdgeInsets = UIEdgeInsetsMake((selfHeight - space - titleRect.origin.y - titleRect.size.height),
                                                        (selfWidth / 2 -  titleRect.origin.x - titleRect.size.width / 2) - (selfWidth - titleRect.size.width) / 2,
                                                        -(selfHeight - space - titleRect.origin.y - titleRect.size.height),
                                                        -(selfWidth / 2 -  titleRect.origin.x - titleRect.size.width / 2) - (selfWidth - titleRect.size.width) / 2);
                self.imageEdgeInsets = UIEdgeInsetsMake(0,
                                                        (selfWidth / 2 - imageRect.origin.x - imageRect.size.width / 2),
                                                        0,
                                                        -(selfWidth / 2 - imageRect.origin.x - imageRect.size.width / 2));
            } break;
            case UIButtonImageTitleStyleCenterUp: {
                self.titleEdgeInsets = UIEdgeInsetsMake(-(titleRect.origin.y + titleRect.size.height - imageRect.origin.y + space),
                                                        (selfWidth / 2 -  titleRect.origin.x - titleRect.size.width / 2) - (selfWidth - titleRect.size.width) / 2,
                                                        (titleRect.origin.y + titleRect.size.height - imageRect.origin.y + space),
                                                        -(selfWidth / 2 -  titleRect.origin.x - titleRect.size.width / 2) - (selfWidth - titleRect.size.width) / 2);
                
                self.imageEdgeInsets = UIEdgeInsetsMake(0,
                                                        (selfWidth / 2 - imageRect.origin.x - imageRect.size.width / 2),
                                                        0,
                                                        -(selfWidth / 2 - imageRect.origin.x - imageRect.size.width / 2));
            } break;
            case UIButtonImageTitleStyleCenterDown: {
                self.titleEdgeInsets = UIEdgeInsetsMake((imageRect.origin.y + imageRect.size.height - titleRect.origin.y + space),
                                                        (selfWidth / 2 -  titleRect.origin.x - titleRect.size.width / 2) - (selfWidth - titleRect.size.width) / 2,
                                                        -(imageRect.origin.y + imageRect.size.height - titleRect.origin.y + space),
                                                        -(selfWidth / 2 -  titleRect.origin.x - titleRect.size.width / 2) - (selfWidth - titleRect.size.width) / 2);
                
                self.imageEdgeInsets = UIEdgeInsetsMake(0,
                                                        (selfWidth / 2 - imageRect.origin.x - imageRect.size.width / 2),
                                                        0,
                                                        -(selfWidth / 2 - imageRect.origin.x - imageRect.size.width / 2));
            } break;
            case UIButtonImageTitleStyleRightLeft: {  // 图片在右，文字在左，距离按钮两边边距
                self.titleEdgeInsets = UIEdgeInsetsMake(0,
                                                        -(titleRect.origin.x - space),
                                                        0,
                                                        (titleRect.origin.x - space));
                
                self.imageEdgeInsets = UIEdgeInsetsMake(0,
                                                        (selfWidth - space - imageRect.origin.x - imageRect.size.width),
                                                        0,
                                                        -(selfWidth - space - imageRect.origin.x - imageRect.size.width));
            } break;
            case UIButtonImageTitleStyleLeftRight: { // 图片在左，文字在右，距离按钮两边边距
                self.titleEdgeInsets = UIEdgeInsetsMake(0,
                                                        (selfWidth - space - titleRect.origin.x - titleRect.size.width),
                                                        0,
                                                        -(selfWidth - space - titleRect.origin.x - titleRect.size.width));
                self.imageEdgeInsets = UIEdgeInsetsMake(0,
                                                        -(imageRect.origin.x - space),
                                                        0,
                                                        (imageRect.origin.x - space));
            } break;
            default: break;
        }
    } else {
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    }
}

@end
