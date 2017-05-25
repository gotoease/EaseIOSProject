//
//  FMUIUtil.m
//  FMBaseProject
//
//  Created by shanjin on 2017/5/25.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "FMUIUtil.h"

@implementation FMUIUtil
+ (UILabel *)createLabWithText:(NSString *)t font:(UIFont *)f textColor:(UIColor *)cc textAliment:(NSTextAlignment)alinement maxWidth:(float)maxW{
    CGSize sz = [FMUtil sizeForFont:t Font:f CtrlSize:CGSizeMake(maxW, MAXFLOAT)];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, sz.width, sz.height)];
    lab.font = f;
    lab.textColor = cc;
    lab.text = t;
    lab.textAlignment = alinement;
    lab.userInteractionEnabled = NO;
    return lab;
}

+ (UIButton *)createBtnWithText:(NSString *)t font:(UIFont *)f textColor:(UIColor *)color {
    CGSize sz = [FMUtil sizeForFont:t Font:f CtrlSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:t forState:UIControlStateNormal];
    [btn setTitle:t forState:UIControlStateHighlighted];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateHighlighted];
    btn.titleLabel.font = f;
    btn.frame = CGRectMake(0, 0, sz.width, 30);
    return btn;
}
@end
