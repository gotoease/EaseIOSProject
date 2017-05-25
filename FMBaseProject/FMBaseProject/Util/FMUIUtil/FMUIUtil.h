//
//  FMUIUtil.h
//  FMBaseProject
//
//  Created by shanjin on 2017/5/25.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMUIUtil : NSObject
+ (UILabel *)createLabWithText:(NSString *)t font:(UIFont *)f textColor:(UIColor *)cc textAliment:(NSTextAlignment)alinement maxWidth:(float)maxW;
+ (UIButton *)createBtnWithText:(NSString *)t font:(UIFont *)f textColor:(UIColor *)color;
@end
