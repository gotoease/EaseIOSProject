//
//  FMNavBar.m
//  FMBaseProject
//
//  Created by shanjin on 2016/10/10.
//  Copyright © 2016年 付新明. All rights reserved.
//

#import "FMNavBar.h"

@interface FMBarItem(){
    
}
@end

@implementation FMBarItem

- (id)init{
    if (self = [super init]) {
    }
    return self;
}

+ (id)itemWith:(NSString *)title withClick:(void (^)(id it))clickEvent{
    FMBarItem *item = [[FMBarItem alloc] init];
    item.itemStyle = 0;
    item.itemTitle = title;
    item.onClick = clickEvent;
    return item;
}

+ (id)itemImg:(NSString *)img withClick:(void (^)(id it))clickEvent{
    FMBarItem *item = [[FMBarItem alloc] init];
    item.itemStyle = 1;
    item.itemTitle = img;
    item.onClick = clickEvent;
    item.imgSize = CGSizeMake(APP_CONTENT_HIGHT_PRAM(17), APP_CONTENT_HIGHT_PRAM(17));
    return item;
}

+ (id)itemHomeMesImg:(NSString *)img withClick:(void (^)(id it))clickEvent
{
    FMBarItem *item = [[FMBarItem alloc] init];
    item.itemStyle = 1;
    item.itemTitle = img;
    item.onClick = clickEvent;
    item.imgSize = CGSizeMake(24, 24);
    return item;
}

+ (id)itemHomeImg:(NSString *)img withClick:(void (^)(id it))clickEvent
{
    FMBarItem *item = [[FMBarItem alloc] init];
    item.itemStyle = 1;
    item.itemTitle = img;
    item.onClick = clickEvent;
    item.imgSize = CGSizeMake(50, 44);
    return item;
}

+ (id)itemHomeImg:(NSString *)img homeWith:(NSString *)title withClick:(void (^)(id it))clickEvent
{
    FMBarItem *item = [[FMBarItem alloc] init];
    item.itemStyle = 2;
    item.itemTitle = title;
    item.itemImg = img;
    item.onClick = clickEvent;
    item.imgSize = CGSizeMake(6, 6);
    return item;
}

@end

@implementation FMNavBar{
    UILabel *titleLab;
    UIView *leftView;
    UIView *rightView;
}
@synthesize lineImg;
- (id)init{
    self = [super initWithFrame:CGRectMake(0, 0,kScreenWidth, kNavigationBarHeight)];
    if (self){
        self.backgroundColor = [UIColor whiteColor];
        titleLab = [[UILabel alloc] initWithFrame:CGRectMake(50, kStatusBarHeight, kScreenWidth-100, self.height-kStatusBarHeight)];
        titleLab.font = kFont(18);
        titleLab.textColor = kCommonBlackColor;
        titleLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLab];
        
        leftView = [[UIView alloc] initWithFrame:CGRectMake(0, kStatusBarHeight, kScreenWidth/2, 44)];
        leftView.backgroundColor = [UIColor clearColor];
        [self addSubview:leftView];
        
        rightView = [[UIView alloc] initWithFrame:CGRectMake(leftView.right, kStatusBarHeight, kScreenWidth/2, 44)];
        rightView.backgroundColor = [UIColor clearColor];
        [self addSubview:rightView];
        
        lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight-0.5, kScreenWidth, 0.5)];
        lineImg.backgroundColor = kLineBgColor;
        [self addSubview:lineImg];
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    titleLab.text = [FMUtil strRelay:self.title];
    [leftView removeAllSubviews];
    [rightView removeAllSubviews];
    
    float offsetX = 0;
    if (self.leftItemList&&[self.leftItemList count]>0) {
        for (int i = 0; i < self.leftItemList.count; i++) {
            FMBarItem *it = self.leftItemList[i];
            FMButton *btn = nil;
            if (it.itemStyle == 1) {
                btn = [self createImgBtn:it];
            } else if (it.itemStyle == 0) {
                btn = [self createTitleBtn:it];
            } else if (it.itemStyle == 2) {
                btn = [self createTitleAndImageBtn:it];
            }
            btn.left = offsetX;
            offsetX = btn.right;
            [leftView addSubview:btn];
        }
    }
    
    offsetX = kScreenWidth/2;
    if (self.rightItemList&&[self.rightItemList count]>0) {
        for (int i = 0; i < self.rightItemList.count; i++) {
            FMBarItem *it = self.rightItemList[i];
            FMButton *btn = nil;
            if (it.itemStyle == 1) {
                btn = [self createImgBtn:it];
            } else if (it.itemStyle == 0) {
                btn = [self createTitleBtn:it];
            } else if (it.itemStyle == 2) {
                btn = [self createTitleAndImageBtn:it];
            }
            btn.left = offsetX-btn.width;
            offsetX = btn.left;
            [rightView addSubview:btn];
        }
    }
}

- (FMButton *)createImgBtn:(FMBarItem *)item{
    float offsetX = (50-item.imgSize.width)/2;
    float offsetY = (44-item.imgSize.height)/2;
    
    FMButton *btn = [[FMButton alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    // iphone6plus 专用
    if (offsetX == 0 && offsetY == 0 && (iPhone6_Plus || iPhone6)) {
        [btn setImage:[[UIImage imageNamed:item.itemTitle] scaleToSize:CGSizeMake(23, 23)] forState:UIControlStateNormal];
    } else {
        [btn setImage:[UIImage imageNamed:item.itemTitle] forState:UIControlStateNormal];
    }
    [btn setImageEdgeInsets:UIEdgeInsetsMake(offsetY, offsetX, offsetY, offsetX)];
    btn.bbbb = item;
    [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)btnPress:(FMButton *)btn {
    FMBarItem *item = btn.bbbb;
    if (item.onClick) {
        item.onClick(nil);
    }
}

- (FMButton *)createTitleBtn:(FMBarItem *)item{
    UIColor *ccc = [UIColor clearColor];//FM_Color_Nav_Client;
    CGSize sz = [FMUtil sizeForFont:item.itemTitle Font:kFont(15) CtrlSize:CGSizeMake(600, 44)];
    float w = sz.width+10+10;
    if (w<50) {
        w = 50;
    }
    float offsetX = (50-w)/2;
    
    FMButton *btn = [[FMButton alloc] initWithFrame:CGRectMake(0, 0, w, 44)];
    [btn setTitle:item.itemTitle forState:UIControlStateNormal];
    [btn setBackgroundImage:[FMColor CreateImageFromColor:ccc] forState:UIControlStateNormal];
    [btn setBackgroundImage:[FMColor CreateImageFromColor:kBgColor] forState:UIControlStateHighlighted];
    [btn setTitleColor:kCommonBlackColor forState:UIControlStateNormal];
    if (item.titleColor) {
        [btn setTitleColor:item.titleColor forState:UIControlStateNormal];
    }
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, offsetX, 0, offsetX)];
    btn.titleLabel.font = kFont(15);
    btn.bbbb = item;
    [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (FMButton *)createTitleAndImageBtn:(FMBarItem *)item
{
    FMButton *btn = [[FMButton alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    [btn setTitle:item.itemTitle forState:UIControlStateNormal];
    [btn setTitleColor:kRedColor forState:UIControlStateNormal];
    btn.titleLabel.font = kFont(15);
    [btn setTitleEdgeInsets:(UIEdgeInsets){.right = 14}];
    [btn setImage:[UIImage imageNamed:item.itemImg] forState:UIControlStateNormal];
    [btn setImageEdgeInsets:(UIEdgeInsets){.left = btn.titleLabel.right + (item.imgSize.width*2) - 3,
        .top = btn.titleLabel.bottom - item.imgSize.height - 3}];
    btn.bbbb = item;
    [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)setRightItemList:(NSArray *)nRightItemList{
    _rightItemList = nRightItemList;
    [self setNeedsLayout];
}

- (void)setLeftItemList:(NSArray *)nLeftItemList{
    _leftItemList = nLeftItemList;
    [self setNeedsLayout];
}

@end
