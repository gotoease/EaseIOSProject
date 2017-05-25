//
//  FMUtil.m
//  FMBaseProject
//
//  Created by shanjin on 16/9/18.
//  Copyright © 2016年 付新明. All rights reserved.
//

#import "FMUtil.h"

@implementation FMUtil
+ (BOOL)strNilOrEmpty:(NSString *)str{
    return str == nil
    || str == NULL
    || [str isKindOfClass:[NSNull class]]
    ||([str respondsToSelector:@selector(length)]
       && [(NSData *)str length] == 0)
    || ([str respondsToSelector:@selector(count)]
        && [(NSArray *)self count] == 0);
}

+ (NSString *)strRelay:(id)str
{
    if([FMUtil strNilOrEmpty:str]){
        return @"";
    }
    else if([str isKindOfClass:[NSString class]]){
        return str;
    }
    else if([str isKindOfClass:[NSNumber class]]){
        return [str stringValue];
    }
    return str;
}

#pragma mark - Convert

+ (NSString *)strFromInt:(int)ntValue{
    return [NSString stringWithFormat:@"%d", ntValue];
}

+ (NSString *)strFromBool:(BOOL)boolValue{
    NSString *str = @"0";
    if (boolValue) {
        str = @"1";
    }
    return str;
}

+ (NSString *)strFromId:(id)objectValue{
    if ([objectValue isKindOfClass:[NSNumber class]]) {
        return [objectValue stringValue];
    }
    else if([objectValue isKindOfClass:[NSString class]]){
        return (NSString *)objectValue;
    }
    else{
        return @"";
    }
}

+ (BOOL)strToBool:(NSString *)boolStr{
    if ([[FMUtil strRelay:boolStr] isEqualToString:@"1"]) {
        return YES;
    }
    return NO;
}

+ (UIImage *)imgRes:(NSString *)imageName{
    NSString *resPath = [FMFile fileResourceDir:imageName];
    UIImage *img = [UIImage imageWithContentsOfFile:resPath];
    return img;
}

+(AppDelegate *)appDelegate
{
    return ((AppDelegate *)[UIApplication sharedApplication].delegate);
}

+ (CGSize)sizeForFont:(NSString *)str Font:(UIFont *)font CtrlSize:(CGSize)size
{
    CGSize sz = CGSizeZero;
    NSDictionary *attributes = @{NSFontAttributeName:font,};
    sz = [str boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine |
          NSStringDrawingUsesLineFragmentOrigin |
          NSStringDrawingUsesFontLeading
                        attributes:attributes
                           context:nil].size;
    return sz;
}

+ (CGFloat)heightForFont:(NSString *)str Font:(UIFont *)font CtrlSize:(CGSize)size
{
    CGSize sz = CGSizeZero;
    NSDictionary *attributes = @{NSFontAttributeName:font};
    sz = [str boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine |
          NSStringDrawingUsesLineFragmentOrigin |
          NSStringDrawingUsesFontLeading
                        attributes:attributes
                           context:nil].size;
    return sz.height;
}


+ (id) processDictionaryIsNSNull:(id)obj{
    const NSString *blank = @"";
    if ([obj isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *dt = [(NSMutableDictionary*)obj mutableCopy];
        for(NSString *key in [dt allKeys]) {
            id object = [dt objectForKey:key];
            if([object isKindOfClass:[NSNull class]]) {
                [dt setObject:blank
                       forKey:key];
            }
            else if ([object isKindOfClass:[NSString class]]){
                NSString *strobj = (NSString*)object;
                if ([strobj isEqualToString:@"<null>"]) {
                    [dt setObject:blank
                           forKey:key];
                }
            }
            else if ([object isKindOfClass:[NSNumber class]]){
                NSString *strobj = (NSString*)object;
                [dt setObject:[NSString stringWithFormat:@"%@",strobj]
                       forKey:key];
            }
            else if ([object isKindOfClass:[NSArray class]]){
                NSArray *da = (NSArray*)object;
                da = [self processDictionaryIsNSNull:da];
                [dt setObject:da
                       forKey:key];
            }
            else if ([object isKindOfClass:[NSDictionary class]]){
                NSDictionary *ddc = (NSDictionary*)object;
                ddc = [self processDictionaryIsNSNull:ddc];
                [dt setObject:ddc forKey:key];
            }
        }
        return [dt copy];
    }
    else if ([obj isKindOfClass:[NSArray class]]){
        NSMutableArray *da = [(NSMutableArray*)obj mutableCopy];
        for (int i=0; i<[da count]; i++) {
            NSDictionary *dc = [obj objectAtIndex:i];
            dc = [self processDictionaryIsNSNull:dc];
            [da replaceObjectAtIndex:i withObject:dc];
        }
        return [da copy];
    }
    else{
        return obj;
    }
}

+ (NSString *)getAppVersion{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

@end
