//
//  FMFormViewController.h
//  FMBaseProject
//
//  Created by shanjin on 2016/10/25.
//  Copyright © 2016年 付新明. All rights reserved.
//

#import "FXMBaseViewController.h"
#import "RETableViewManager.h"
#import "FMEmptyCell.h"
@interface FMFormViewController : FXMBaseViewController<RETableViewManagerDelegate>
@property (nonatomic, strong) RETableViewManager *formManager;  //表单管理器
@property (nonatomic, strong) UITableView *formTable;           //表单表格
@property (nonatomic, assign) BOOL hasHeadRefresh;              //是否具有上拉刷新
-(NSMutableArray*)rightBtnClickedPopToOneViewCotroller:(NSString *)classString;//右键直接跳回某个viewcontroller

@property (nonatomic, strong) NSMutableArray *sectionArray;
@property (nonatomic, strong) RETableViewSection *section0;
- (void)addHeader;
@end
