//
//  NSString+Hash.m
//
//  Created by liblto on 2016/8/23.
//  Copyright © 2018年 Edwin Jarvis. All rights reserved.
//

#import "NSString+Hash.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Hash)

- (NSString *)md5String {
    const char *str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (int)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}
- (NSString *)fileMd5String {
    // 生成文件的MD5   校验的是压缩包的MD5  判断下载是否正确
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:self];
    NSAssert(handle != nil, @"文件出错，请检查文件路径是否正确!");
    /**
     1.NSAssert只会在debug模式下起作用、所以assert应该只用过错误处理、而不是异常处理。如果是防卫性编程、请使用异常处理
     2.NSAssert 会占用较多的系统资源
     3.NSAssert一次最好只关注一个条件、不要同时去判断多个条件、有利于捕捉错误。
     */
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    BOOL done = NO;
    while(!done) {
        NSData *fileData = [handle readDataOfLength: 256 ];
        CC_MD5_Update(&md5, [fileData bytes], (int)[fileData length]);
        if( [fileData length] == 0 ) done = YES;
    }
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    NSString *fileMD5 = [NSString stringWithFormat:
                         @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                         digest[0], digest[1], digest[2], digest[3],
                         digest[4], digest[5], digest[6], digest[7],
                         digest[8], digest[9], digest[10], digest[11],
                         digest[12], digest[13], digest[14], digest[15]];
    return fileMD5;
}

@end
