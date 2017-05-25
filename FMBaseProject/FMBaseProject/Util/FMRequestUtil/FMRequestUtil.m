//
//  FMRequestUtil.m
//  FMBaseProject
//
//  Created by shanjin on 2017/5/25.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "FMRequestUtil.h"

@implementation FMRequestUtil
+(FMRequestUtil *)sharedInstance {
    static FMRequestUtil  * instance = nil;
    static dispatch_once_t predict;
    dispatch_once(&predict, ^{
        instance = [[FMRequestUtil alloc] init];
    });
    return instance;
}

/**
 *  封装AFN的GET请求
 *
 *  @param URLString 网络请求地址
 *  @param dict      参数(可以是字典或者nil)
 *  @param succeed   成功后执行success block
 *  @param failure   失败后执行failure block
 */
- (void)GET:(NSString *)URLString dict:(id)dict succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure
{
    //创建网络请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //发送网络请求(请求方式为GET)
    [manager GET:URLString parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succeed(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
/**
 *  封装AFN的POST请求
 *
 *  @param URLString 网络请求地址
 *  @param dict      参数(可以是字典或者nil)
 *  @param succeed   成功后执行success block
 *  @param failure   失败后执行failure block
 */
- (void)POST:(NSString *)URLString dict:(id)dict succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];//创建管理器方法，AFHTTPSessionManager封装了常见的HTTP方法
    //    iOS程序访问HTTP资源时需要对URL进行Encode，比如像拼出来的 http://ami.ac?p1=%+&sa f&p2=中文，其中的中文、特殊符号&％和空格都必须进行转译才能正确访问
    
    
    //  默认提交请求的数据是二进制的,返回格式是JSON；如果提交数据是JSON的,需要将请求格式设置为AFJSONRequestSerializer
    //  设置请求格式
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //    设置返回格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.stringEncoding = NSUTF8StringEncoding;//设置服务器返回数据字符串编码
    
    [manager POST:URLString parameters:dict progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              
              NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
              succeed(dataDic);
              
              
          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              NSLog(@"Post请求失败=====%@",error);
               failure(error);
          }];
    }

/**
 *  封装AFN的上传文件请求
 *
 *  @param URLString 网络请求地址
 *  @param dict      参数(可以是字典或者nil)
 *  @param succeed   成功后执行success block
 *  @param files   文件
 *  @param failure   失败后执行failure block
 */
- (void)uploadFile:(NSString *)URLString dict:(id)dict files:(NSArray *)files succeed:(void (^)(id data))succeed fail:(void (^)(NSError *error))failure{
    //1。创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    [manager setSecurityPolicy:[NSObject customSecurityPolicy]];
    manager.requestSerializer.cachePolicy=NSURLRequestReloadIgnoringLocalCacheData;
    if (files==nil||[files count]==0) {
        [manager.requestSerializer setTimeoutInterval:30];
    }
    else{
        [manager.requestSerializer setTimeoutInterval:120];
    }

    [manager POST:URLString parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (files&&files.count>0) {
            for (int k = 0; k < [files count]; k++) {
                NSDictionary *dic = [files objectAtIndex:k];
                NSString *key = [[dic allKeys] objectAtIndex:0];
                NSData *fileData = [NSData dataWithContentsOfFile:[FMUtil strRelay:dic[key]]];
                NSString *fileName = [FMUtil strRelay:dic[key]];
                fileName = [fileName lastPathComponent];
                if (fileData) {
                    [formData appendPartWithFileData:fileData name:key fileName:[FMUtil strRelay:fileName] mimeType:@"*/*"];
                }
            }
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succeed(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       failure(error);
    }];
}
@end
