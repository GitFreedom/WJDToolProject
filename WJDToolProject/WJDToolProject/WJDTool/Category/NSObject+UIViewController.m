//
//  NSObject+UIViewController.m
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/8.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import "NSObject+UIViewController.h"
#import <UIKit/UIViewController.h>
#import <UIKit/UINavigationController.h>
#import <UIKit/UITabBarController.h>
#import <UIKit/UIApplication.h>
#import <UIKit/UIWindow.h>

@implementation NSObject (UIViewController)

+ (UIViewController *)getCurrentVC {
    
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    if ([rootVC isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navVC = (UINavigationController *)rootVC;
        return navVC.topViewController;
    }
    else if ([rootVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabVC = (UITabBarController *)rootVC;
        UIViewController *selectedVC = tabVC.selectedViewController;
        if ([selectedVC isKindOfClass:[UINavigationController class]]) {
            UINavigationController *navVC = (UINavigationController *)selectedVC;
            return navVC.topViewController;
        }
        else {
            return selectedVC;
        }
    }
    return rootVC;
}

@end
