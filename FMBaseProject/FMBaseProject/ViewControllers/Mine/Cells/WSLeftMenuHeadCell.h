//
//  WSSettingCell.h
//  OMengClient
//
//  Created by shanjin on 15/8/4.
//  Copyright (c) 2015年 shanjin. All rights reserved.
//

#import "RETableViewCell.h"
#import "RETableViewItem.h"
@interface WSLeftMenuHeadItem : RETableViewItem
@property (nonatomic,strong) NSString *captionText;
@property (nonatomic,copy) NSString *iconImgName;
@property (copy, readwrite, nonatomic) void (^uploadHead)(id item);
@end


@interface WSLeftMenuHeadCell : RETableViewCell
@property (strong, nonatomic) WSLeftMenuHeadItem *item;


@end
