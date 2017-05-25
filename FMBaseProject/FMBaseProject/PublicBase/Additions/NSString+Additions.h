//
//  NSString+Additions.h
//  FMBaseProject
//
//  Created by shanjin on 16/9/18.
//  Copyright © 2016年 付新明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Additions)
/**
 *	@brief	移除字符串首位空字符串.
 *
 *	@return	字符串实例.
 */
- (NSString *)trim;
//纯数字
- (BOOL)stringIsNumber;
//字母和数字
- (BOOL)stringIsNumberOrChar;
//身份证
- (BOOL)stringIsPersonCardNo;

- (BOOL)isIncludingEmoji;
- (instancetype)removedEmojiString;

+(NSString *) jsonStringWithString:(NSString *) string;
+(NSString *) jsonStringWithArray:(NSArray *)array;
+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary;
+(NSString *) jsonStringWithObject:(id) object;
@end
