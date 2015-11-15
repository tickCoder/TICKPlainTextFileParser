//
//  TICKPlainTextFileParser.h
//  TICKPlainTextFileParser
//
//  Created by Milk on 2015.11.14.Saturday.
//  Copyright © 2015 tickCoder. All rights reserved.
//

/*
 UTF8:用1到6个字节编码UNICODE字符,起始0xEFBBBF
 GB2312:
 GBK:
 GB18030:
 BIG5:
 ASCII:
 ANSI
 UTF16:
 UTF32:
 
 
 ANSI-三国演义:<202020>:gb2312,gb18030,utf8
 ANSI-水浒传:<0d0a2d>:gb2312,gb18030
 ANSI-红楼梦:<202020>:gb2312,gb18030
 ANSI-西游记:<a1a1a1>:gb2312,gb18030
 35岁以前成功的12条黄金法则:<e3808a>:utf8
 [小说][科学超电磁炮][SS]:<bfc6d1>:gb2312,gb18030
 三生三世十里桃花:<0d0a0d>:utf8,
 人脉是设计出来的:<efbbbf>:gb2312,gb18030,utf8
 公主坟(全文阅读):<e585ac>:utf8
 悟空传:<e38080>:utf8
 我的老婆是公主:<e4b9a6>:utf8
 硅谷禁书II  copy:<e7a185>:utf8
 硅谷禁书Ⅰ copy:<2d2d2d>:utf8
 硅谷禁书Ⅲ  copy:<e590b8>:utf8
 硅谷禁书Ⅴ copy:<e7a185>:utf8
 落花時節又逢君:<0d0ae3>:utf8
 誅仙:<e7acac>:utf-8
 
 
 UTF8-xxx:<efbbbf>:utf-8

*/

#import <Foundation/Foundation.h>

@class TICKPlainTextFileParser;
@protocol TICKPlainTextFileParserDelegate <NSObject>
@optional
- (void)tick_plainTextFileParser:(TICKPlainTextFileParser *)aParser;
@end

@interface TICKPlainTextFileParser : NSObject
@property (nonatomic, copy, readonly) NSString *filePath;
@property (nonatomic, assign, readonly, getter=isSync) BOOL sync;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFilePath:(NSString *)aFilePath NS_DESIGNATED_INITIALIZER;
- (void)parse:(BOOL)aSync;
- (void)parse:(BOOL)aSync encoding:(NSStringEncoding)aEncoding;
@end
