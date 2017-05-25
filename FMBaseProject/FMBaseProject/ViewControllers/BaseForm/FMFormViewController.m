//
//  FMFormViewController.m
//  FMBaseProject
//
//  Created by shanjin on 2016/10/25.
//  Copyright © 2016年 付新明. All rights reserved.
//

#import "FMFormViewController.h"

@interface FMFormViewController ()

@end

@implementation FMFormViewController
@synthesize sectionArray;
@synthesize section0;
- (void)viewDidLoad {
    [super viewDidLoad];
    sectionArray = [NSMutableArray array];
    section0 = [RETableViewSection section];
    
    [self initView];
}
- (void)initView
{
    _formTable = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kScreenHeight) style:UITableViewStylePlain];
    _formTable.showsVerticalScrollIndicator = NO;
    _formTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _formTable.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_formTable];
    
    _formManager = [[RETableViewManager alloc] initWithTableView:_formTable];
    _formManager.delegate = self;
    _formManager[@"FMEmptyItem"] = @"FMEmptyCell";
    
}
#pragma mark - RETableViewManagerDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex{
    return 0;
}

- (void)addHeader {
//    WSCustomRefreshHeader *header = [WSCustomRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(getData)];
//    // 隐藏时间
//    header.lastUpdatedTimeLabel.hidden = YES;
//    // 隐藏状态
//    header.stateLabel.hidden = YES;
//    // 设置header
//    self.formTable.mj_header = header;
}
#pragma mark - 右键直接跳回某个viewcontroller
-(NSMutableArray*)rightBtnClickedPopToOneViewCotroller:(NSString *)classString{
    int m = 0;
    int n = 0;
    NSMutableArray *viewControllers=[NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    for (int i = 0; i < viewControllers.count; i ++) {
        UIViewController *controller = [viewControllers objectAtIndex:i];
        m++;
        if ([controller isKindOfClass:NSClassFromString(classString)]){
            n = m;
        }
    }
    for (int j = 0; j < m - n; j++) {
        [viewControllers removeLastObject];
    }
    return viewControllers;
}

-(void)formTableReload{
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}
@end
