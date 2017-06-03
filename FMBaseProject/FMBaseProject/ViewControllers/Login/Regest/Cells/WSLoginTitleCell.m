//
//  WSLoginTitleCell.m
//  OMengMerchant
//
//  Created by ZhangQun on 2017/1/11.
//  Copyright © 2017年 shanjin. All rights reserved.
//

#import "WSLoginTitleCell.h"

@implementation WSLoginTitleItem
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellHeight = 50;
        self.titleColor = WS_COLOR_C4_332929;
        self.titleFont = FMFontSys(24);
    }
    return self;
}
@end

@interface WSLoginTitleCell ()
{
    UILabel *_titleLabel;
}
@end
@implementation WSLoginTitleCell
- (void)cellDidLoad
{
    [super cellDidLoad];
    _titleLabel = [UILabel new];
    [self.contentView addSubview:_titleLabel];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.numberOfLines = 0;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)layoutSubviews
{
    [super layoutSubviews];
    _titleLabel.frame = CGRectMake(20, 10, FMScreenWidth - 40, 30);
}

- (void)cellWillAppear
{
    [super cellWillAppear];
    _titleLabel.textColor = self.item.titleColor;
    _titleLabel.font = self.item.titleFont;
    _titleLabel.textAlignment = self.item.titleAlignment;
    _titleLabel.text = [FMUtil strRelay:self.item.titleString];
}
@end
