//
//  WSFormTextCell.m
//  OMengMerchant
//
//  Created by jienliang on 14-5-9.
//  Copyright (c) 2014年 YK. All rights reserved.
//

#import "WSLoginBtnCell.h"

@implementation WSLoginBtnItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 80;
        self.titleText = @"登录";
        self.tipText = @"";
        self.bgColor = [UIColor whiteColor];
        self.btnRect = CGRectMake(10, 20, FMScreenWidth-10*2, 65-20);
        self.cofirmColor = WS_COLOR_C1_ff584d;
        self.btnEnable = YES;
        self.isHasCorner = YES;
        self.isLoginBtnEnable = YES;
    }
    return self;
}

@end

@interface WSLoginBtnCell()
{
    UIButton *btn;
    UILabel *tiplabel;
}
@end

@implementation WSLoginBtnCell
- (void)cellDidLoad
{
    [super cellDidLoad];
    
    btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, FMScreenWidth-20*2, 65-20)];
    btn.layer.cornerRadius = 4;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundImage:[FMColor CreateImageFromColor:WS_COLOR_C1_ff584d] forState:UIControlStateNormal];
    [btn setBackgroundImage:[FMColor CreateImageFromColor:WS_COLOR_C2_ff8880] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[FMColor CreateImageFromColor:WS_COLOR_C7_dbd5d5] forState:UIControlStateDisabled];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPress) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.masksToBounds = YES;
    [self.contentView addSubview:btn];
    
    tiplabel = [[UILabel alloc]initWithFrame:CGRectMake(btn.left +15, btn.bottom +10, btn.width - 20, 20)];
    [tiplabel setFont:[UIFont systemFontOfSize:13]];
    tiplabel.textColor = WS_COLOR_C4_332929;
    [self.contentView addSubview:tiplabel];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    self.backgroundColor = self.item.bgColor;
    self.contentView.backgroundColor = self.item.bgColor;
    [btn setTitle:self.item.titleText forState:UIControlStateNormal];
    [tiplabel setText:[FMUtil strRelay:self.item.tipText]];
    btn.frame = self.item.btnRect;
    
    if (self.item.titleColor) {
        [btn setTitleColor:self.item.titleColor forState:UIControlStateNormal];
    } else {
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    if (self.item.borderColor) {
        [btn.layer setMasksToBounds:YES];
        [btn.layer setBorderWidth:0.8f];
        [btn.layer setBorderColor:self.item.borderColor.CGColor];
    }
    
    if (self.item.cornerRadius) {
        btn.layer.cornerRadius = self.item.cornerRadius;
    }
    [btn setBackgroundImage:[FMColor CreateImageFromColor:self.item.cofirmColor] forState:UIControlStateNormal];
    if (self.item.SelectcofirmColor) {
        [btn setBackgroundImage:[FMColor CreateImageFromColor:self.item.SelectcofirmColor] forState:UIControlStateHighlighted];
    }
    
    if (!self.item.btnEnable) {
        [btn setBackgroundImage:[FMColor CreateImageFromColor:WS_COLOR_C7_dbd5d5] forState:UIControlStateNormal];
    }
    
    if (self.item.fontText) {
        btn.titleLabel.font = self.item.fontText;
    }
    
    if (!self.item.isHasCorner) {
        btn.layer.masksToBounds = NO;
        btn.layer.cornerRadius =0;
    }
    btn.enabled = self.item.btnEnable;
    
    // 登录
    btn.enabled = self.item.isLoginBtnEnable;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)btnPress{
    if (self.item.btnPress) {
        self.item.btnPress();
    }
}
@end
