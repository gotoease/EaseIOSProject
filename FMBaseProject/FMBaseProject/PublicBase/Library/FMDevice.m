//
//  FMDevice.m
//  FMBaseProject
//
//  Created by shanjin on 16/9/18.
//  Copyright © 2016年 付新明. All rights reserved.
//

#import "FMDevice.h"

@implementation FMDevice


+ (FMScreenSize)screenSize{
    UIScreen *ms = [UIScreen mainScreen];
    CGSize tempSize = CGSizeMake(320, 480);
    if ([ms respondsToSelector:@selector(currentMode)]) {
        tempSize = ms.currentMode.size;
    }
    CGFloat width = MIN(tempSize.width, tempSize.height);
    CGFloat height = MAX(tempSize.width, tempSize.height);
    CGSize cmSize = CGSizeMake(width, height);
    if(cmSize.width == 640){
        if(cmSize.height == 1136){
            return FMScreenSizePhone5;
        }
        else{
            return FMScreenSizePhoneRetina;
        }
    }
    else if(cmSize.width == 1024){
        return FMScreenSizePad;
    }
    else if(cmSize.width == 2048){
        return FMScreenSizePadRetina;
    }
    else if(cmSize.width == 750){
        return FMScreenSizePhone6;
    }
    else if(cmSize.width == 1242){
        return FMScreenSizePhone6p;
    }
    else{
        return FMScreenSizePhone;
    }
}

+ (FMScreenDisplay)screenDisplay{
    UIScreen *mainScreen = [UIScreen mainScreen];
    if ([mainScreen respondsToSelector:@selector(scale)] && [mainScreen scale] == 2) {
        return FMScreenDisplayRetina;
    }
    else{
        return FMScreenDisplayNormal;
    }
}

+ (BOOL)screenIsRetina{
    FMScreenDisplay dis = [FMDevice screenDisplay];
    if (dis == FMScreenDisplayRetina) {
        return YES;
    }
    return NO;
}

+ (BOOL)screenIs4Inch{
    FMScreenSize size = [FMDevice screenSize];
    if (size == FMScreenSizePhone5) {
        return YES;
    }
    return NO;
}

+ (BOOL)screenIs4sInch
{
    FMScreenSize size = [FMDevice screenSize];
    if (size == FMScreenSizePhoneRetina) {
        return YES;
    }
    return NO;
}

+ (CGFloat)screenHeight{
    UIScreen *screen = [UIScreen mainScreen];
    CGFloat h = [screen applicationFrame].size.height;
    CGFloat sh = [UIApplication sharedApplication].statusBarFrame.size.height;
    if ([FMDevice deviceIsIOS7]) {
        h += sh;
    }
    return h;
}

+ (CGFloat)screenWidth{
    UIScreen *screen = [UIScreen mainScreen];
    return [screen applicationFrame].size.width;
}

+ (BOOL)deviceIsIOS7{
    NSComparisonResult vRes = [FMDevice deviceOSVersion:7.0];
    if (vRes == NSOrderedAscending || vRes == NSOrderedSame) {
        return YES;
    }
    return NO;
}

+ (NSString *)deviceOSVersion{
    UIDevice *currentDevice = [UIDevice currentDevice];
    return [currentDevice systemVersion];
}

+ (NSComparisonResult)deviceOSVersion:(CGFloat)version{
    UIDevice *currentDevice = [UIDevice currentDevice];
    NSString *strVer = [currentDevice systemVersion];
    CGFloat osVersion = [strVer floatValue];
    if (osVersion > version) {
        return NSOrderedAscending;
    }
    else if(osVersion < version){
        return NSOrderedDescending;
    }
    else{
        return NSOrderedSame;
    }
}

+ (CGFloat)appNavHeight
{
    float h = 44;
    //    if ([FMDevice screenSize] == FMScreenSizePhone6p) {
    //        h = 64;
    //    }
    if ([FMDevice deviceIsIOS7]) {
        return h + 20;
    }
    return h;
}

+ (CGFloat)appTabHeight
{
    float h = 49;
    h = APP_CONTENT_HIGHT_PRAM(h);
    //    if ([FMDevice screenSize] == FMScreenSizePhone6p) {
    //        h = h * 1.5;
    //    }
    return h;
}

+ (CGFloat)conHeight:(FMConHeight)ht{
    CGFloat h = 0;
    h = [FMDevice screenHeight];
    CGFloat navH = [FMDevice appNavHeight];
    switch (ht) {
        case FMConHeightDefault:
            h = [FMDevice screenHeight];
            break;
        case FMConHeightNav:
            h = [FMDevice screenHeight] - navH;
            break;
        case FMConHeightNavTabBottom:
            h = [FMDevice screenHeight] - navH - [FMDevice appTabHeight];
            break;
        default:
            break;
    }
    return h;
}


@end
