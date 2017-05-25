//
//  WSUtil.m
//  OMengMerchant
//
//  Created by fuxinming on 14-4-28.
//  Copyright (c) 2014年 fuxinming. All rights reserved.
//

#import "FMKeyBoardUtil.h"

@interface FMKeyBoardUtil()
@end

@implementation FMKeyBoardUtil
static FMKeyBoardUtil *sharedSingleton = nil;

+ (FMKeyBoardUtil *)sharedInstance
{
    if (sharedSingleton == nil) {
        sharedSingleton = [[FMKeyBoardUtil alloc] init];
        [[YYKeyboardManager defaultManager] addObserver:sharedSingleton];
    }
    return sharedSingleton;
}

#pragma mark - @protocol YYKeyboardObserver

- (void)keyboardChangedWithTransition:(YYKeyboardTransition)transition {
    if (transition.toVisible) {//键盘显示
        CGRect kbFrame = CGRectZero;
        if (self.aTextField){
            kbFrame = [[YYKeyboardManager defaultManager] convertRect:transition.toFrame toView:self.aTextField.superview];
            if (self.showKeyBoard) {
                self.showKeyBoard(kbFrame);
            }
        }
        if (self.aTextView) {
            kbFrame = [[YYKeyboardManager defaultManager] convertRect:transition.toFrame toView:self.aTextView.superview];
            if (self.showKeyBoard) {
                self.showKeyBoard(kbFrame);
            }
        }
    }
    else if(transition.fromVisible&&!transition.toVisible) {//隐藏键盘
        if (self.aTextField) {
            if (self.hiddenKeyBoard) {
                self.hiddenKeyBoard();
            }
        }
        if (self.aTextView) {
            if (self.hiddenKeyBoard) {
                self.hiddenKeyBoard();
            }
        }
    }
//    [UIView animateWithDuration:transition.animationDuration delay:0 options:transition.animationOption animations:^{
//        CGRect textframe = self.aTextField.frame;
//
//        textframe.size.width = kbFrame.size.width;
//        textframe.origin.y = kbFrame.origin.y - textframe.size.height;
//        self.aTextField.frame = textframe;
//    } completion:^(BOOL finished) {
//    }];
}

-(void)dealloc{
    [[YYKeyboardManager defaultManager] removeObserver:sharedSingleton];
}
@end
