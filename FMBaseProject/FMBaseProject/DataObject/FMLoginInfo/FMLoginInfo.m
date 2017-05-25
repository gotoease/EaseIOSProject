//
//  FMLoginInfo.m
//  FMBaseProject
//
//  Created by shanjin on 2017/5/24.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "FMLoginInfo.h"

@implementation FMLoginInfo
+ (FMLoginInfo *)loginInfoWithDict:(NSDictionary *)dInfo{
    FMLoginInfo *loginInfo = [[FMLoginInfo alloc] init];
    loginInfo.phone = [FMUtil strRelay:dInfo[@"phone"]];
    loginInfo.name = [FMUtil strRelay:dInfo[@"name"]];
    loginInfo.iconUrl = [FMUtil strRelay:dInfo[@"portraitPath"]];
    loginInfo.encryptedKey = [FMUtil strRelay:dInfo[@"encryptedKey"]];
    loginInfo.sex = [FMUtil strRelay:dInfo[@"sex"]];
    loginInfo.userId = [FMUtil strRelay:dInfo[@"id"]];
    loginInfo.userType = [FMUtil strRelay:dInfo[@"userType"]];

    loginInfo.dynamicKey = [FMUtil strRelay:dInfo[@"dynamicKey"]];
    loginInfo.appVersion = [FMUtil strRelay:dInfo[@"appVersion"]];
    loginInfo.nickname = [FMUtil strRelay:dInfo[@"nickname"]];
    return loginInfo;
}

+ (NSString *)getUserInfoFile {
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = [paths objectAtIndex:0];
    NSString * path = [documentsDirectory stringByAppendingPathComponent:@"user.txt"];
    return path;
}

+ (void)writeUserInfo:(NSDictionary *)dic {
    NSString *fileName = [FMLoginInfo getUserInfoFile];
    if ([FMFile fileExistAtPath:fileName]) {
        [FMFile fileDel:fileName];
    }
    dic = [FMUtil processDictionaryIsNSNull:dic];
    NSString *str = [NSString jsonStringWithObject:dic];
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [data writeToFile:fileName atomically:YES];
}

+ (NSDictionary *)getUserDic {
    NSString *fileName = [FMLoginInfo getUserInfoFile];
    NSString *version = [FMUtil getAppVersion];
    if ([FMFile fileExistAtPath:fileName]) {
        NSData *data = [NSData dataWithContentsOfFile:fileName];
        if (data) {
            NSDictionary *d = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSMutableDictionary *dic = nil;
            if (d!=nil) {
                dic = [[NSMutableDictionary alloc] init];
                [dic addEntriesFromDictionary:d];
                if (![[FMUtil strRelay:dic[@"appVersion"]] isEqualToString:version]) {
                    return nil;
                }
            }
            return dic;
        }
    }
    return nil;
}

+ (FMLoginInfo *)getUserInfo {
    NSDictionary *dic = [FMLoginInfo getUserDic];
    NSLog(@"%@",dic);
    if (dic==nil) {
        return nil;
    }
    FMLoginInfo *loginInfo = [FMLoginInfo loginInfoWithDict:dic];
    return loginInfo;
}

+ (BOOL)isLogin {
    if ([FMUtil appDelegate].loginInfo==nil||
        [FMUtil strNilOrEmpty:[FMUtil appDelegate].loginInfo.userId]) {
        return NO;
    }
    NSString *str = [FMUtil getAppVersion];
    if (![[FMUtil strRelay:[FMUtil appDelegate].loginInfo.appVersion] isEqualToString:str]) {
        return NO;
    }
    return YES;
}
@end
