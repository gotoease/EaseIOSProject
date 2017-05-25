//
//  FMLoginInfo.h
//  FMBaseProject
//
//  Created by shanjin on 2017/5/24.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMLoginInfo : NSObject

@property (nonatomic, copy) NSString *phone;//手机号
@property (nonatomic, copy) NSString *name;//用户名
@property (nonatomic, copy) NSString *encryptedKey;//加密字符串
@property (nonatomic, copy) NSString *dynamicKey;//动态秘钥
@property (nonatomic, copy) NSString *sex;//性别
@property (nonatomic, copy) NSString *userId;//用户id
@property (nonatomic, copy) NSString *userType;//用户类型
@property (nonatomic, copy) NSString *iconUrl;//头像
@property (nonatomic, copy) NSString *nickname;//昵称

@property (nonatomic, copy) NSString *appVersion;//应用版本信息

//登录信息转换成对象
+ (FMLoginInfo *)loginInfoWithDict:(NSDictionary *)dInfo;
//获取存储在本地的登录文件路径
+ (NSString *)getUserInfoFile;
//写入本地登录文件路径
+ (void)writeUserInfo:(NSDictionary *)dic;
//获取用户信息
+ (FMLoginInfo *)getUserInfo;
//获取用户信息
+ (NSDictionary *)getUserDic;
//判断是否登录
+ (BOOL)isLogin;


@end
