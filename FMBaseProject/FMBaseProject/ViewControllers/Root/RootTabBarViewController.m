//
//  RootViewController.m
//  FMBaseProject
//
//  Created by shanjin on 2016/10/17.
//  Copyright © 2016年 付新明. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "MainViewController.h"
#import "WorkViewController.h"
#import "MineViewController.h"
#import "DiscoverViewController.h"
@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    MainViewController *home=[[MainViewController alloc] init];
    home.myTitle = @"首页";
    [self addChildVc:home title:@"首页" image:@"home2" selectedImage:@"home"];
    

    WorkViewController *work=[[WorkViewController alloc] init];
    work.myTitle = @"工作";
    [self addChildVc:work title:@"工作" image:@"near" selectedImage:@"near2"];

    DiscoverViewController *discover=[[DiscoverViewController alloc] init];
    discover.myTitle = @"发现";
    [self addChildVc:discover title:@"发现" image:@"find" selectedImage:@"find2"];

    MineViewController *own=[[MineViewController alloc] init];
    own.myTitle = @"我";
    [self addChildVc:own title:@"我" image:@"my" selectedImage:@"my2"];
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    
    childVc.tabBarItem.title = title; // 设置tabbar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] =kBlackColor;
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = kRGBColor(0.08*255, 0.68*255, 0.4*255);
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    //childVc.view.backgroundColor = HWRandomColor;
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
    
}

@end
