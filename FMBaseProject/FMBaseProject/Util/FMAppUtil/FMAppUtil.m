//
//  FMAppUtil.m
//  FMBaseProject
//
//  Created by shanjin on 2017/5/24.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "FMAppUtil.h"
#import "LoginViewController.h"
@implementation FMAppUtil
+ (void)goToLogin {
    LoginViewController *login = [[LoginViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:login];
    nav.navigationBarHidden = YES;
    [[FMUtil appDelegate].window.rootViewController presentViewController:nav animated:YES completion:nil];
}
@end
