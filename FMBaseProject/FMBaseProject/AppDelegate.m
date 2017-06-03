//
//  AppDelegate.m
//  FMBaseProject
//
//  Created by shanjin on 2016/10/9.
//  Copyright © 2016年 付新明. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc] init];
    self.window.frame=[UIScreen mainScreen].bounds;
    
    //设置根控制器
    RootTabBarViewController *rootVC = [[RootTabBarViewController alloc] init];
    rootVC.delegate = self;
    self.window.rootViewController=rootVC;
    [self.window makeKeyAndVisible];
    
    AddNotification(UIKeyboardWillShowNotification, @selector(onHandleKeyboardWillShow));
    AddNotification(UIKeyboardWillHideNotification, @selector(onHandleKeyboardWillHide));
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if ([viewController.tabBarItem.title isEqualToString:@"我"]) {
        if (![FMLoginInfo isLogin]) {
            
            [FMAppUtil goToLogin];
        }
    }
    
}

-(void)showToast:(NSString *)str {
    [self performSelector:@selector(showToastT:) withObject:str afterDelay:0.2];
}

- (void)showToastT:(id)ttt {
    [KSToastView ks_showToast:[FMUtil strRelay:ttt]];
}


- (void)onHandleKeyboardWillShow {
    _isKeyboard = YES;
}

- (void)onHandleKeyboardWillHide {
    _isKeyboard = NO;
}


@end
