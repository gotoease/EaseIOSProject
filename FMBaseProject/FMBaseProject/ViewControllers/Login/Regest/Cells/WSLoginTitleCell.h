//
//  WSLoginTitleCell.h
//  OMengMerchant
//
//  Created by ZhangQun on 2017/1/11.
//  Copyright © 2017年 shanjin. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>

@interface WSLoginTitleItem : RETableViewItem
@property (nonatomic,copy) NSString *titleString;
@property (nonatomic,copy) UIColor *titleColor;
@property (nonatomic,copy) UIFont *titleFont;
@property (nonatomic)      NSTextAlignment  titleAlignment;
@end

@interface WSLoginTitleCell : RETableViewCell
@property (nonatomic,strong) WSLoginTitleItem *item;
@end
