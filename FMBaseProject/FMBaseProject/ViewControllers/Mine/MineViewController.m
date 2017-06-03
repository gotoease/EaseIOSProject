//
//  MineViewController.m
//  FMBaseProject
//
//  Created by shanjin on 2016/10/19.
//  Copyright © 2016年 付新明. All rights reserved.
//

#import "MineViewController.h"
#import "WSLeftMenuCell.h"
#import "WSLeftMenuHeadCell.h"
#import "WSLoginBtnCell.h"

@interface MineViewController ()
@property (nonatomic,strong)WSLeftMenuHeadItem *item01;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = self.myTitle;
    
    self.formManager[@"WSLeftMenuHeadItem"] = @"WSLeftMenuHeadCell";
    self.formManager[@"WSLeftMenuItem"] = @"WSLeftMenuCell";
    self.formManager[@"WSLoginBtnItem"] = @"WSLoginBtnCell";
    
     [self initForm];
}

- (void)initForm{
    WS(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection sectionWithHeaderTitle:@""];
    
    self.item01 = [[WSLeftMenuHeadItem alloc]init];
    self.item01.uploadHead = ^(WSLeftMenuHeadItem *item){
//        [bself uploadTouXiang];
    };
    [section0 addItem:self.item01];

    
    WSLeftMenuItem *item03 = [[WSLeftMenuItem alloc ]init];
    item03.captionText = @"我的关注";
    item03.iconImgName = @"icon_myWallet";
    item03.selectionHandler = ^(WSLeftMenuItem *item){
        if (![FMLoginInfo isLogin]) {
            [bself goLogin];
            return;
        }else{
//            WSRootNavPush([[WSWalletViewController alloc] init]);
        }
    };
    [section0 addItem:item03];
    
    WSLeftMenuItem *item04 = [[WSLeftMenuItem alloc ]init];
    item04.captionText = @"完善个人信息";
    item04.iconImgName = @"icon_myCollection";
    item04.selectionHandler = ^(WSLeftMenuItem *item){
        if (![FMLoginInfo isLogin]) {
            [bself goLogin];
            return;
        }
//        WSRootNavPush([[WSMyCollectViewController alloc] init]);
    };
    [section0 addItem:item04];
    
    WSLeftMenuItem *item05 = [[WSLeftMenuItem alloc ]init];
    item05.captionText = @"升级成住家";
    item05.iconImgName = @"icon_mykefua";
    item05.selectionHandler = ^(WSLeftMenuItem *item){
        
    };
    [section0 addItem:item05];
    
    WSLeftMenuItem *item06 = [[WSLeftMenuItem alloc ]init];
    item06.captionText = @"推荐给朋友";
    item06.iconImgName = @"icon_mySetting";
    item06.selectionHandler = ^(WSLeftMenuItem *item){
       
    };
    [section0 addItem:item06];
    
    WSLeftMenuItem *item07 = [[WSLeftMenuItem alloc ]init];
    item07.captionText = @"账号设置";
    item07.iconImgName = @"icon_mySetting";
    item07.selectionHandler = ^(WSLeftMenuItem *item){
        
    };
    [section0 addItem:item07];
    
    WSLeftMenuItem *item08 = [[WSLeftMenuItem alloc ]init];
    item08.captionText = @"通用设置";
    item08.iconImgName = @"icon_mySetting";
    item08.selectionHandler = ^(WSLeftMenuItem *item){
        
    };
    [section0 addItem:item08];
    
    
    WSLeftMenuItem *item09 = [[WSLeftMenuItem alloc ]init];
    item09.captionText = @"意见反馈";
    item09.iconImgName = @"icon_mySetting";
    item09.selectionHandler = ^(WSLeftMenuItem *item){
        
    };
    [section0 addItem:item09];
    
    WSLoginBtnItem *loginItem = [[WSLoginBtnItem alloc] init];
    loginItem.titleText = @"退出登录";
    loginItem.isLoginBtnEnable = YES;
    loginItem.bgColor = [UIColor clearColor];
    loginItem.cofirmColor = WS_COLOR_C1_ff584d;
    loginItem.btnRect = CGRectMake(20, 20, FMScreenWidth -20*2, 48);
    loginItem.btnPress = ^(void){
        WSMakeToastInKeyWindow(@"退出");
    };
    [section0 addItem:loginItem];
    
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
    
}


- (void)goLogin {
    [FMAppUtil goToLogin];
}
@end
