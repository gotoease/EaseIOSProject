//
//  FMFormTextCell.h
//  OMengMerchant
//
//  Created by fuxinming on 14-5-9.
//  Copyright (c) 2014年 fuxinming. All rights reserved.
//

#import "RETableViewCell.h"
#import "RETableViewItem.h"
#import "WSSTextField.h"
@interface TextInputItem : RETableViewItem
@property (nonatomic,copy) NSString *defaultPhone;
@property (nonatomic,copy) NSString *phone;
@property (nonatomic,copy) NSString *placeholder;
@property (nonatomic,assign) BOOL isPhoneWithPassword;
@property (nonatomic,assign) int maxLength;
@property (nonatomic,assign) int maxLengthHint; // 提示位
@property(nonatomic,assign) BOOL textFieldEditing;
@property (copy, readwrite, nonatomic) void (^didUserLoginInputBlock)(BOOL isCheck);
@end

@interface TextInputCell : RETableViewCell
@property (strong, readwrite, nonatomic) TextInputItem *item;
@property (nonatomic,strong) WSSTextField *textField;
@end
