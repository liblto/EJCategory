//
//  NSString+Hash.h
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Hash)

/**
 MD5换算 生成字符的MD5
 @return MD5
 */
- (NSString *)md5String;
/**
 MD5换算 生成文件的MD5
 @return MD5
 */
- (NSString *)fileMd5String;

@end
