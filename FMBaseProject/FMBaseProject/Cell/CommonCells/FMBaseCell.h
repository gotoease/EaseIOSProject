//
//  FMSwipeCell.h
//  SwipeCell
//
//  Created by Steven on 15/12/17.
//  Copyright © 2015年 Steven. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>

@interface FMBaseItem : RETableViewItem
@property (nonatomic,assign) int bottomHeight;//tableView距离底部距离，用于计算键盘高度
@end

@interface FMBaseCell : RETableViewCell
@property (nonatomic,readwrite,strong) FMBaseItem *item;
@property (nonatomic,readwrite,assign) float bTableViewHeight;

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
@end
