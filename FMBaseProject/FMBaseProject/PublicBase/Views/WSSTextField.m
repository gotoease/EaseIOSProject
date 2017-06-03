//
//  WSSTextField.m
//  OMengClient
//
//  Created by shanjin on 15/11/27.
//  Copyright © 2015年 shanjin. All rights reserved.
//

#import "WSSTextField.h"

@implementation WSSTextField

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.hasCopyAndPast = NO;
    }
    return self;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (!self.hasCopyAndPast) {
        if (action == @selector(paste:))//禁止粘贴
            return NO;
        if (action == @selector(select:))// 禁止选择
            return NO;
        if (action == @selector(selectAll:))// 禁止全选
            return NO;
    }
    return [super canPerformAction:action withSender:sender];
}

@end
