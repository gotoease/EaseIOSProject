//
//  WSSettingCell.h
//  OMengClient
//
//  Created by shanjin on 15/8/4.
//  Copyright (c) 2015年 shanjin. All rights reserved.
//

#import "RETableViewCell.h"
#import "RETableViewItem.h"
@interface WSLeftMenuItem : RETableViewItem
@property (nonatomic,strong) NSString *captionText;
@property (nonatomic,copy) NSString *iconImgName;
@property (nonatomic,assign) BOOL  haveTipImage;

@property (nonatomic,copy) id userInfo;
@end


@interface WSLeftMenuCell : RETableViewCell
@property (strong, nonatomic) WSLeftMenuItem *item;


@end
