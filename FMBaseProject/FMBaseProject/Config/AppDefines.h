//
//  AppDefines.h
//  FMBaseProject
//
//  Created by shanjin on 2017/5/25.
//  Copyright © 2017年 付新明. All rights reserved.
//

#ifndef AppDefines_h
#define AppDefines_h

#define WSMakeToastInKeyWindow(str)     [[FMUtil appDelegate] showToast:str];


#define AddNotification(notifiName,notifiSelector) \
[[NSNotificationCenter defaultCenter] addObserver:self selector:(notifiSelector) name:(notifiName) object:nil]
#define PostNotification(notifiName,obj) \
[[NSNotificationCenter defaultCenter] postNotificationName:notifiName object:obj]

#define RemoveNotification(notifiName)     \
[[NSNotificationCenter defaultCenter] removeObserver:self \
name:notifiName \
object:nil]
#define RemoveAllNotification()     \
[[NSNotificationCenter defaultCenter] removeObserver:self]
/**
 *	@brief	系统字体.
 */
#define FMFontSys(_size) [UIFont systemFontOfSize:_size]
#define FMImage(name) [UIImage imageNamed:name]
#define FMRootNavPush(vc) [(UINavigationController *)[FMUtil appDelegate].window.rootViewController pushViewController:vc animated:YES]

#define WS_COLOR_C4_332929 kColorHex(@"#332929") //标题栏文字/功能项目标题  深黑色
#define WS_COLOR_C7_dbd5d5 kColorHex(@"#dbd5d5") //线条颜色 占位字符颜色
#define WS_COLOR_C1_ff584d kColorHex(@"#ff584d")//app标准色/按钮色/突显色  红色
#define WS_COLOR_C2_ff8880 kColorHex(@"#ff8880") //点缀色   浅红色
#endif /* AppDefines_h */
