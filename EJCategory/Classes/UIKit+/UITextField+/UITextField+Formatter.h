//
//  UITextField+Formatter.h
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, EJTextFieldType) {
    EJTextFieldTypePhone = 0,   /**< 手机号. */
    EJTextFieldTypeIDCard,      /**< 身份证号. */
    EJTextFieldTypeBankCard,    /**< 银行卡号. */
};
@interface UITextField (Formatter)
- (BOOL)shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string textFieldType:(EJTextFieldType)type;
@end
