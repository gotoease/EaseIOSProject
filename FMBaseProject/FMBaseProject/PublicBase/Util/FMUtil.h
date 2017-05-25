//
//  FMUtil.h
//  FMBaseProject
//
//  Created by shanjin on 16/9/18.
//  Copyright © 2016年 付新明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
@interface FMUtil : NSObject
/**
 *	@brief	判断字符串是否是空或NULL
 *
 *	@return	Yes为空，NO不为空
 */
+ (BOOL)strNilOrEmpty:(NSString *)str;
/**
 *	@brief	字符串格式化，将空字符串格式为@""
 *
 *	@return	返回字符串
 */
+ (NSString *)strRelay:(id)str;
+ (NSString *)strFromInt:(int)ntValue;
+ (NSString *)strFromBool:(BOOL)boolValue;
+ (NSString *)strFromId:(id)objectValue;
+ (BOOL)strToBool:(NSString *)boolStr;

/**
 *	@brief	获取app目录中的图片, 不缓存.
 *
 *	@param 	imageName 	图片名称.
 *
 *	@return	imageName对应的图片.
 */
+ (UIImage *)imgRes:(NSString *)imageName;

+(AppDelegate *)appDelegate;

+ (CGSize)sizeForFont:(NSString *)str Font:(UIFont *)font CtrlSize:(CGSize)size;
+ (CGFloat)heightForFont:(NSString *)str Font:(UIFont *)font CtrlSize:(CGSize)size;

+ (id) processDictionaryIsNSNull:(id)obj;


//获取版本号
+ (NSString *)getAppVersion;
@end
