//
//  WSUtil.h
//  OMengMerchant
//
//  Created by fuxinming on 14-4-28.
//  Copyright (c) 2014年 fuxinming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <YYKeyboardManager/YYKeyboardManager.h>

/**
 *	@brief全局信息类.
 */
@interface FMKeyBoardUtil : NSObject<YYKeyboardObserver>{
}
@property (nonatomic,weak)UITextField *aTextField;
@property (nonatomic,weak)UITextView *aTextView;
@property (nonatomic,copy) void(^showKeyBoard)(CGRect rect);
@property (nonatomic,copy) void(^hiddenKeyBoard)(void);

+ (FMKeyBoardUtil *)sharedInstance;
@end
