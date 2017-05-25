//
//  FMSwipeCell.m
//  SwipeCell
//
//  Created by Steven on 15/12/17.
//  Copyright © 2015年 Steven. All rights reserved.
//

#import "FMBaseCell.h"
#import "FMKeyBoardUtil.h"

@implementation FMBaseItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.bottomHeight = 0;
    }    
    return self;
}

@end



@interface FMBaseCell()
{
}
@end

@implementation FMBaseCell
@synthesize bTableViewHeight;

- (void)cellDidLoad
{
    [super cellDidLoad];
    bTableViewHeight = self.tableViewManager.tableView.height;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    WS(bself);
    [FMKeyBoardUtil sharedInstance].aTextField = textField;
    [FMKeyBoardUtil sharedInstance].showKeyBoard = ^(CGRect rect){
        CGRect frame = [textField convertRect:textField.bounds toView:nil];
        bself.tableViewManager.tableView.height = bTableViewHeight - rect.size.height+bself.item.bottomHeight;
        float offsetY = frame.origin.y+textField.height;
        float ooo = kScreenHeight-rect.size.height;
        if (offsetY>ooo) {
            float xxxxx = bself.tableViewManager.tableView.contentOffset.y+offsetY-ooo;
            [bself.tableViewManager.tableView setContentOffset:CGPointMake(bself.tableViewManager.tableView.contentOffset.x, xxxxx)];
        }
    };
    [FMKeyBoardUtil sharedInstance].hiddenKeyBoard = ^(){
        bself.tableViewManager.tableView.height = bTableViewHeight;
        [FMKeyBoardUtil sharedInstance].aTextField = nil;
    };
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textVieFMhouldBeginEditing:(UITextView *)textView {
    WS(bself);
    [FMKeyBoardUtil sharedInstance].aTextView = textView;
    [FMKeyBoardUtil sharedInstance].showKeyBoard = ^(CGRect rect){
        CGRect frame = [textView convertRect:textView.bounds toView:nil];
        bself.tableViewManager.tableView.height = bTableViewHeight - rect.size.height+bself.item.bottomHeight;
        float offsetY = frame.origin.y+20;
        float ooo = kScreenHeight-rect.size.height;
        if (offsetY>ooo) {
            float xxxxx = bself.tableViewManager.tableView.contentOffset.y+offsetY-ooo;
            [bself.tableViewManager.tableView setContentOffset:CGPointMake(bself.tableViewManager.tableView.contentOffset.x, xxxxx)];
        }
    };
    [FMKeyBoardUtil sharedInstance].hiddenKeyBoard = ^(){
        bself.tableViewManager.tableView.height = bTableViewHeight;
    };
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    [FMKeyBoardUtil sharedInstance].aTextView = nil;
}

@end
