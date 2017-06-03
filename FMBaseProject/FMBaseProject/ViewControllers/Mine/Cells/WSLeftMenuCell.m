//
//  WSSettingCell.m
//  OMengClient
//
//  Created by shanjin on 15/8/4.
//  Copyright (c) 2015年 shanjin. All rights reserved.
//

#import "WSLeftMenuCell.h"

@implementation WSLeftMenuItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 48;
        self.haveTipImage = NO;
    }
    return self;
}

@end
@implementation WSLeftMenuCell{
    UILabel *captionLab;
    UIImageView *iconImg;
    UIImageView *arrowImg;
    UIView *_circle;
    UIImageView *tipImage;
    
}

- (void)cellDidLoad
{
    [super cellDidLoad];
//    iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(32, (48-18)/2, 18, 18)];
//    [self.contentView addSubview:iconImg];
    
    //说明文字
    captionLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImg.right + 18, iconImg.top + 2, 100, 14)];
    captionLab.font = FMFontSys(15);
    captionLab.textColor = WS_COLOR_C4_332929;
    captionLab.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:captionLab];
//    tipImage = [[UIImageView alloc] initWithFrame:CGRectMake(32, (48-18)/2, 18, 18)];
//    tipImage.image = [UIImage imageNamed:@"icon_tuijianyoujiang"];
//    tipImage.hidden = YES;
//    [self.contentView addSubview:tipImage];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
}

- (void)cellWillAppear
{
    [super cellWillAppear];
    captionLab.text = [FMUtil strRelay:self.item.captionText];
    [captionLab sizeToFit];
    [iconImg setImage:[UIImage imageNamed:self.item.iconImgName]];
    
    if (self.item.haveTipImage) {
        tipImage.hidden = NO;
        tipImage.left = captionLab.right + 2;
        
    }else{
        tipImage.hidden = YES;
    }

}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
