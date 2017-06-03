//
//  WSSettingCell.m
//  OMengClient
//
//  Created by shanjin on 15/8/4.
//  Copyright (c) 2015年 shanjin. All rights reserved.
//

#import "WSLeftMenuHeadCell.h"

@implementation WSLeftMenuHeadItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 144;
    }
    return self;
}

@end
@implementation WSLeftMenuHeadCell{
    UILabel *_userNameLabel;
    UIButton *iconImg;
}

- (void)cellDidLoad
{
    [super cellDidLoad];

    self.contentView.backgroundColor = [UIColor clearColor];
    iconImg = [[UIButton alloc] initWithFrame:CGRectMake(32, 64, 56, 56)];
   
    iconImg.layer.masksToBounds = YES;
    iconImg.layer.cornerRadius = 28.0;
    iconImg.layer.borderColor = [UIColor whiteColor].CGColor;
    iconImg.layer.borderWidth =0.5;
    [iconImg setBackgroundImage:[UIImage imageNamed:@"icon_shop_price_g"] forState:UIControlStateNormal];
    [iconImg addTarget:self action:@selector(uploadTouXiang) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:iconImg];

    _userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(iconImg.right+18, 64, FMScreenWidth - 210, 56)];
    _userNameLabel.text = @"点击登录";
    _userNameLabel.userInteractionEnabled = YES;
    _userNameLabel.font = FMFontSys(18);
    _userNameLabel.backgroundColor = [UIColor clearColor];
    _userNameLabel.textColor = WS_COLOR_C4_332929;
    [self.contentView addSubview:_userNameLabel];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(uploadTouXiang)];
    [_userNameLabel addGestureRecognizer:tapGesture];

    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(24, 143.5, FMScreenWidth - 48, 0.5)];
    line.backgroundColor = WS_COLOR_C7_dbd5d5;
    [self.contentView addSubview:line];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
}

- (void)cellWillAppear
{
    [super cellWillAppear];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    UIImage *placeholder;
    placeholder = FMImage(@"ic_landing_nickname");
    
    if ([FMLoginInfo isLogin]) {
        if ([FMUtil strRelay:[FMUtil appDelegate].loginInfo.nickname].length>0) {
            
            _userNameLabel.text = [FMUtil strRelay:[FMUtil appDelegate].loginInfo.nickname];
        }else{
            _userNameLabel.text = @"还未设置昵称";
        }
        
        [iconImg sd_setBackgroundImageWithURL:[NSURL URLWithString:[FMUtil strRelay:[FMUtil appDelegate].loginInfo.iconUrl]] forState:UIControlStateNormal placeholderImage:placeholder];
        [iconImg sd_setBackgroundImageWithURL:[NSURL URLWithString:[FMUtil strRelay:[FMUtil appDelegate].loginInfo.iconUrl]] forState:UIControlStateHighlighted placeholderImage:placeholder];
    } else {
       
        _userNameLabel.text = @"点击登录";
        [iconImg setBackgroundImage:placeholder forState:UIControlStateNormal];
        [iconImg setBackgroundImage:placeholder forState:UIControlStateHighlighted];
    
    }
    
}

-(void)uploadTouXiang{
    if (self.item.uploadHead) {
        self.item.uploadHead(self.item);
    }
}
@end
