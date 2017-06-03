//
//  RegisterViewController.m
//  FMBaseProject
//
//  Created by shanjin on 2017/6/3.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "RegisterViewController.h"
#import "WSLoginBtnCell.h"
#import "WSLoginTitleCell.h"
#import "TextInputCell.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"注册";
    self.view.backgroundColor = [UIColor whiteColor];
    self.formManager[@"TextInputItem"] = @"TextInputCell";
    self.formManager[@"WSLoginTitleItem"] = @"WSLoginTitleCell";
    self.formManager[@"WSLoginBtnItem"] = @"WSLoginBtnCell";

    [self initForm];
    
}


- (void)initForm
{
    WS(bself);
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@""];
    
    FMEmptyItem *emptyItem = [[FMEmptyItem alloc] initWithHeight:30];
    [section addItem:emptyItem];
    
    WSLoginTitleItem *titleItem = [[WSLoginTitleItem alloc]init];
    titleItem.titleAlignment = NSTextAlignmentLeft;
    titleItem.titleString = @"邮箱注册";
    [section addItem:titleItem];
    
    
    TextInputItem *userItem = [[TextInputItem alloc]init];
    userItem.placeholder = @"请输入邮箱";
    userItem.maxLength = 20;
    userItem.maxLengthHint = 20;
    [section addItem:userItem];
    
    TextInputItem *passItem = [[TextInputItem alloc]init];
    passItem.placeholder = @"请输入密码";
    passItem.maxLength = 20;
    passItem.maxLengthHint = 20;
    passItem.isPhoneWithPassword = YES;
    [section addItem:passItem];
    
    WSLoginBtnItem *loginItem = [[WSLoginBtnItem alloc] init];
    loginItem.titleText = @"登录";
    loginItem.isLoginBtnEnable = YES;
    loginItem.bgColor = [UIColor clearColor];
    loginItem.cofirmColor = WS_COLOR_C1_ff584d;
    loginItem.btnRect = CGRectMake(20, 20, FMScreenWidth -20*2, 48);
    loginItem.btnPress = ^(void){
        [bself.view endEditing:YES];
        
        NSString *phone = [FMUtil strRelay:userItem.phone];
        NSString *code = [FMUtil strRelay:passItem.phone];
        if ([FMUtil strNilOrEmpty:phone]) {
            WSMakeToastInKeyWindow(@"请输入邮箱");
            return;
        }
        
        if ([FMUtil strNilOrEmpty:code]) {
            WSMakeToastInKeyWindow(@"请输入验证码");
            return;
        }
        
        [bself getDynamicKeyPhone:phone Password:code];
    };
    [section addItem:loginItem];
    
    [self.formManager replaceSectionsWithSectionsFromArray:@[section]];
    [self.formTable reloadData];
}


-(void)getDynamicKeyPhone:(NSString *)userName Password:(NSString *)code{
    NSString *urlString = @"http://192.168.1.23/register?";
    NSDictionary *params = @{@"userName":userName,@"password":code};
    FMRequestUtil *req = [FMRequestUtil sharedInstance];
    [req POST:urlString dict:params succeed:^(id data) {
        NSLog(@"%@",data);
    } failure:^(NSError *error) {
        NSLog(@"%@",error.userInfo);
    }];
}
@end
