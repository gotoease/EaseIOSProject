//
//  FMFormTextCell.m
//  OMengMerchant
//
//  Created by fuxinming on 14-5-9.
//  Copyright (c) 2014年 fuxinming. All rights reserved.
//

#import "FMEmptyCell.h"

@implementation FMEmptyItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 8;
        self.bgColor = [UIColor clearColor];
        self.hasLine = NO;
    }
    return self;
}

- (id)initWithHeight:(float)height {
    if (self = [super init]) {
        self.cellHeight = height;
        self.bgColor = [UIColor clearColor];
        self.hasLine = NO;
    }
    return self;
}

@end

@interface FMEmptyCell()
{
    UIView *lineImg;
}
@end

@implementation FMEmptyCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    lineImg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kLineHeight)];
    lineImg.backgroundColor = kLineBgColor;
    lineImg.hidden = YES;
    [self.contentView addSubview:lineImg];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
}

- (void)layoutSubvieFM
{
    [super layoutSubviews];
    self.contentView.backgroundColor = self.item.bgColor;
    lineImg.top = self.height - kLineHeight;
    lineImg.hidden = !self.item.hasLine;
}

@end
