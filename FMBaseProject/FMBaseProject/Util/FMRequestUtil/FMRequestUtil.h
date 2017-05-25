//
//  FMRequestUtil.h
//  FMBaseProject
//
//  Created by shanjin on 2017/5/25.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface FMRequestUtil : NSObject

+(FMRequestUtil *)sharedInstance;

- (void)GET:(NSString *)URLString dict:(id)dict succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;

- (void)POST:(NSString *)URLString dict:(id)dict succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;

- (void)uploadFile:(NSString *)URLString dict:(id)dict files:(NSArray *)files succeed:(void (^)(id data))succeed fail:(void (^)(NSError *error))failure;
@end
