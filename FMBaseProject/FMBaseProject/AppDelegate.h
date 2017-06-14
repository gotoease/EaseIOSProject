//
//  AppDelegate.h
//  FMBaseProject
//
//  Created by shanjin on 2016/10/9.
//  Copyright © 2016年 付新明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootTabBarViewController.h"
#import "FMLoginInfo.h"
#import "KSToastView.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) FMLoginInfo *loginInfo;//登录数据
@property (assign, nonatomic) BOOL isKeyboard;
- (void)showToast:(NSString *)str;
-(void)gotoRoot;
@end

