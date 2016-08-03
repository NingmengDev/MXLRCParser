//
//  MXLRCParser.h
//  MXLRCParser
//
//  Created by 韦纯航 on 16/8/3.
//  Copyright © 2016年 韦纯航. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MXLRCLine : NSObject

@property (assign, nonatomic) NSTimeInterval time;
@property (copy, nonatomic) NSString *content;

@end


typedef void (^MXLRCParserObjectsBlock)(NSArray <MXLRCLine *> *objects);
typedef void (^MXLRCParserStringBlock)(NSString *string);

@interface MXLRCParser : NSObject

/**
 *  解析歌词文件
 *
 *  @param path       歌词文件路径
 *  @param completion 回调
 */
+ (void)parseLRCWithContentsOfFile:(NSString *)path completion:(MXLRCParserObjectsBlock)completion;

/**
 *  解析歌词数据
 *
 *  @param data       歌词数据
 *  @param completion 回调
 */
+ (void)parseLRCWithData:(NSData *)data completion:(MXLRCParserObjectsBlock)completion;

/**
 *  解析歌词内容
 *
 *  @param contents   歌词内容
 *  @param completion 回调
 */
+ (void)parseLRCWithContents:(NSString *)contents completion:(MXLRCParserObjectsBlock)completion;

@end
