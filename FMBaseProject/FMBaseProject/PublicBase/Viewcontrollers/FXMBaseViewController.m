//
//  FXMBaseViewController.m
//  FMBaseProject
//
//  Created by shanjin on 2016/10/9.
//  Copyright © 2016年 付新明. All rights reserved.
//

#import "FXMBaseViewController.h"
#import "MBProgressHUD.h"
@interface FXMBaseViewController (){
    
}
- (void)initNav;
@end

@implementation FXMBaseViewController
@synthesize navHidden = _navHidden;
    
    
#pragma mark - lifecycle
    
- (id)init{
        self = [super init];
        if (self) {
            // Custom initialization
            _navHidden = NO;
            self.hiddenBack = NO;
        }
        return self;
}
    
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _navHidden = NO;
        self.hiddenBack = NO;
    }
    return self;
}
    

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    
    // iOS 7 ScrollView顶部空白适配.
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]){
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self initNav];
    [self.view setBackgroundColor:kCommonBgColor];
}
    
#pragma mark - Private
- (void)initNav{
    WS(bself);
    if (!self.navHidden) {
        _navBar = [[FMNavBar alloc] init];
        if (bself.navigationController){
            NSArray *array = bself.navigationController.viewControllers;
            if ([array count] > 0) {
                id rootVC = [self.navigationController.viewControllers objectAtIndex:0];
                id topVC = self.navigationController.topViewController;
                if (self != rootVC && self == topVC && !self.hiddenBack) {
                    _navBar.leftItemList = [NSArray arrayWithObject:[FMBarItem itemImg:@"back" withClick:^(id it) {
                        [bself backBtnPress];
                    }]];
                }
            }
        }
        [self.view addSubview:_navBar];
    }
}

- (void)backBtnPress {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)hiddenLoading {
    [MBProgressHUD hideAllHUDsForView:[FMUtil appDelegate].window animated:YES];
}

- (void)showLoading {
    [MBProgressHUD showHUDAddedTo:[FMUtil appDelegate].window animated:YES];
}

- (void)popToViewController:(NSString *)cls{
    NSMutableArray *ar = [[NSMutableArray alloc] init];
    for (int i = 0; i < [self.navigationController.viewControllers count]; i++) {
        id ttt = [self.navigationController.viewControllers objectAtIndex:i];
        [ar addObject:ttt];
        if ([ttt isKindOfClass:[NSClassFromString(cls) class]]) {
            break;
        }
    }
    [self.navigationController setViewControllers:ar animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
