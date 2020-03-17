//
//  UITextField+Formatter.m
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import "UITextField+Formatter.h"

// 手机号334格式空格处光标所处位置长度分别为3，8
static const NSInteger kPhoneNumBreakpointSt    = 3;
static const NSInteger kPhoneNumBreakpointNd    = 8;
// 身份证号684格式空格处光标所处位置分别为6，15
static const NSInteger kIDNumBreakpointSt       = 6;
static const NSInteger kIDNumBreakpointNd       = 15;
// 银行卡证号684格式空格处光标所处位置分别为4，9，14，19，24
static const NSInteger kBankCardNumBreakpointSt = 4;
static const NSInteger kBankCardNumBreakpointNd = 9;
static const NSInteger kBankCardNumBreakpointRd = 14;
static const NSInteger kBankCardNumBreakpointTh = 19;
static const NSInteger kBankCardNumBreakpointLa = 24;

@implementation UITextField (Formatter)

- (BOOL)shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string textFieldType:(EJTextFieldType)type {
    if ([string isEqualToString:@""]) { // 删除
        if (range.length == 1) {    // 删除一位
            // 最后一位,遇到空格则多删除一次
            if (range.location == self.text.length - 1) {
                return YES;
            } else {   // 从中间删除
                NSInteger offset = range.location;
                if (range.location < self.text.length && [self.text characterAtIndex:range.location] == ' ' && [self.selectedTextRange isEmpty]) {
                    [self deleteBackward];
                    offset --;
                }
                [self deleteBackward];
                self.text = [self insertString:self.text type:type];
                // 光标偏移量
                UITextPosition *newPosition = [self positionFromPosition:self.beginningOfDocument offset:offset];
                self.selectedTextRange = [self textRangeFromPosition:newPosition toPosition:newPosition];
                return NO;
            }
        } else if (range.length > 1) {  // 删除多位
            // 是否从最后一位开始删除
            BOOL isLast = (range.location + range.length == self.text.length) ? YES : NO;
            [self deleteBackward];
            self.text = [self insertString:self.text type:type];
            
            NSInteger offset = range.location;
            [self shouldChangeCharactersInRange:range textFieldType:type locationOffset:offset];
            if (!isLast) {
                UITextPosition *newPosition = [self positionFromPosition:self.beginningOfDocument offset:offset];
                self.selectedTextRange = [self textRangeFromPosition:newPosition toPosition:newPosition];
            }
            return NO;
        } else {    // 正常输入
            return YES;
        }
    } else if (string.length > 0) { // 限制输入字符个数
        if (type == EJTextFieldTypePhone) {
            if (([self writeSpaseString:self.text].length + string.length - range.length > 11) ) {  // 手机号最多11位
                return NO;
            }
        } else if (type == EJTextFieldTypeIDCard) {
            if (([self writeSpaseString:self.text].length + string.length - range.length > 18) ) {  // 身份证最多18位
                return NO;
            }
        }else if (type == EJTextFieldTypeBankCard) {
            if (([self writeSpaseString:self.text].length + string.length - range.length > 24) ) {  // 银行卡最多24位
                return NO;
            }
        }
        [self insertText:string];
        self.text = [self insertString:self.text type:type];
        
        NSInteger offset = range.location + string.length;
        [self shouldChangeCharactersInRange:range textFieldType:type locationOffset:offset];
        if (type == EJTextFieldTypePhone) {
            if (range.location == kPhoneNumBreakpointSt || range.location  == kPhoneNumBreakpointNd) {
                offset ++;
            }
        } else if (type == EJTextFieldTypeIDCard) {
            if (range.location == kIDNumBreakpointSt || range.location  == kIDNumBreakpointNd) {
                offset ++;
            }
        } else if (type == EJTextFieldTypeBankCard) {
            if (range.location == kBankCardNumBreakpointSt || range.location  == kBankCardNumBreakpointNd || range.location == kBankCardNumBreakpointRd || range.location  == kBankCardNumBreakpointTh || range.location == kBankCardNumBreakpointLa) {
                offset ++;
            }
        }
        UITextPosition *newPosition = [self positionFromPosition:self.beginningOfDocument offset:offset];
        self.selectedTextRange = [self textRangeFromPosition:newPosition toPosition:newPosition];
        return NO;
    } else {
        return YES;
    }
}
/** 相应位数后面增加空格. */
- (NSString *)insertString:(NSString*)string type:(EJTextFieldType)type {
    if (!string) return nil;
    NSMutableString *tStr = [NSMutableString stringWithString:[string stringByReplacingOccurrencesOfString:@" " withString:@""]];
    if (type == EJTextFieldTypePhone) {
        if (tStr.length >kPhoneNumBreakpointSt) {
            [tStr insertString:@" " atIndex:kPhoneNumBreakpointSt];
        }
        if (tStr.length > kPhoneNumBreakpointNd) {
            [tStr insertString:@" " atIndex:kPhoneNumBreakpointNd];
        }
    } else if (type == EJTextFieldTypeIDCard) {
        if (tStr.length >kIDNumBreakpointSt) {
            [tStr insertString:@" " atIndex:kIDNumBreakpointSt];
        }
        if (tStr.length > kIDNumBreakpointNd) {
            [tStr insertString:@" " atIndex:kIDNumBreakpointNd];
        }
    } else if (type == EJTextFieldTypeBankCard) {
        if (tStr.length > kBankCardNumBreakpointSt) {
            [tStr insertString:@" " atIndex:kBankCardNumBreakpointSt];
        }
        if (tStr.length > kBankCardNumBreakpointNd) {
            [tStr insertString:@" " atIndex:kBankCardNumBreakpointNd];
        }
        if (tStr.length > kBankCardNumBreakpointRd) {
            [tStr insertString:@" " atIndex:kBankCardNumBreakpointRd];
        }
        if (tStr.length > kBankCardNumBreakpointTh) {
            [tStr insertString:@" " atIndex:kBankCardNumBreakpointTh];
        }
        if (tStr.length > kBankCardNumBreakpointLa) {
            [tStr insertString:@" " atIndex:kBankCardNumBreakpointLa];
        }
    }
    return  tStr;
}
/** 设置光标位置. */
- (void)shouldChangeCharactersInRange:(NSRange)range textFieldType:(EJTextFieldType)type locationOffset:(NSInteger)offset {
     if (type == EJTextFieldTypePhone) {
        if (range.location == kPhoneNumBreakpointSt || range.location  == kPhoneNumBreakpointNd) {
            offset ++;
        }
     } else if (type == EJTextFieldTypeIDCard) {
         if (range.location == kIDNumBreakpointSt || range.location  == kIDNumBreakpointNd) {
             offset ++;
         }
     } else if (type == EJTextFieldTypeBankCard) {
        if (range.location == kBankCardNumBreakpointSt || range.location  == kBankCardNumBreakpointNd || range.location == kBankCardNumBreakpointRd || range.location  == kBankCardNumBreakpointTh || range.location  == kBankCardNumBreakpointLa) {
            offset ++;
        }
    }
}
/** 删除空格. */
- (NSString*)writeSpaseString:(NSString*)string {
    return [string stringByReplacingOccurrencesOfString:@" " withString:@""];
}

@end
