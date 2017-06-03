//
//  FMFormTextCell.m
//  OMengMerchant
//
//  Created by fuxinming on 14-5-9.
//  Copyright (c) 2014年 fuxinming. All rights reserved.
//

#import "TextInputCell.h"

@implementation TextInputItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 50;
        self.isPhoneWithPassword = NO;
        self.maxLengthHint = 0;
        self.textFieldEditing = YES;
    }
    return self;
}


@end

@interface TextInputCell()<UITextFieldDelegate>
{
    UIView *lineImg;
}
@end

@implementation TextInputCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    _textField = [[WSSTextField alloc]init];
    _textField.frame = CGRectMake(20, 10, FMScreenWidth - 40, 30);
    _textField.delegate = self;
    _textField.returnKeyType = UIReturnKeyDone;
    _textField.textColor = WS_COLOR_C4_332929;
    _textField.font = FMFontSys(15);
    [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.contentView addSubview:_textField];

    
    lineImg = [UIView new];
    lineImg.backgroundColor = WS_COLOR_C7_dbd5d5;
    [self.contentView addSubview:lineImg];
   
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    // 检查密码和普通手机号码
    if (self.item.isPhoneWithPassword) {
        _textField.keyboardType = UIKeyboardTypeNumberPad;
    } else {
        _textField.keyboardType = UIKeyboardTypeDefault;
    }
    // 底部分隔线
    lineImg.frame = CGRectMake(20, 49.5,FMScreenWidth - 40, 0.5);
    
    _textField.placeholder = [FMUtil strRelay:self.item.placeholder];
    _textField.text = [FMUtil strRelay:self.item.defaultPhone];
    
    if(self.item.isPhoneWithPassword){
        _textField.secureTextEntry = YES;
    }else{
        _textField.secureTextEntry = NO;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];

}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

- (void)textFieldDidChange:(UITextField *)textField
{
    if (self.item.maxLengthHint <= 0) {
        return;
    }
    self.item.defaultPhone = textField.text;
    self.item.phone = textField.text;
    if ([self noneSpaseString:textField.text].length >= self.item.maxLengthHint) {
        if (self.item.didUserLoginInputBlock) {
            self.item.didUserLoginInputBlock(YES);
        }
    } else {
        if (self.item.didUserLoginInputBlock) {
            self.item.didUserLoginInputBlock(NO);
        }
    }
}
-(NSString*)noneSpaseString:(NSString*)string
{
    return [string stringByReplacingOccurrencesOfString:@" " withString:@""];
}

@end
