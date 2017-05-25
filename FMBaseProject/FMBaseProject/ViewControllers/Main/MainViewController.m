//
//  MainViewController.m
//  FMBaseProject
//
//  Created by shanjin on 2016/10/19.
//  Copyright © 2016年 付新明. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = self.myTitle;
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *btn = [FMUIUtil createBtnWithText:@"测试测试" font:[UIFont systemFontOfSize:30] textColor:[UIColor blackColor]];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)btnClick{
    FMRequestUtil *req = [FMRequestUtil sharedInstance];

    NSString *urlString = @"http://api.jisuapi.com/iqa/query?";
    NSDictionary *params = @{@"appkey":appkey_1,@"question":@"新乡天气"};
    [req POST:urlString dict:params succeed:^(id data) {
        NSLog(@"%@",data);
    } failure:^(NSError *error) {
        NSLog(@"%@",error.userInfo);
    }];
}

@end
