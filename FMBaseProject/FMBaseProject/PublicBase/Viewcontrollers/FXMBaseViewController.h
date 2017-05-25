//
//  FXMBaseViewController.h
//  FMBaseProject
//
//  Created by shanjin on 2016/10/9.
//  Copyright © 2016年 付新明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMNavBar.h"
/**
 *	@brief	基础视图控制器, 包含导航栏管理, 空数据视图, 等待层, 警告和提醒.
 */
@interface FXMBaseViewController : UIViewController{
    
}
@property (nonatomic,copy) NSString *myTitle;
/**
 *	@brief	导航栏是否隐藏, 默认NO.
 */
@property (nonatomic, assign) BOOL navHidden;
/**
 *	@brief	返回是否隐藏, 默认NO.
 */
@property (nonatomic, assign) BOOL hiddenBack;
/**
 *	@brief	导航栏视图.
 */
@property (nonatomic, strong) FMNavBar *navBar;

- (void)showLoading;
- (void)hiddenLoading;

- (void)backBtnPress;

-(void)popToViewController:(NSString*)str;
@end
