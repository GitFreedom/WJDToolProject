//
//  WJDJumpManager.m
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/8.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import "WJDJumpManager.h"
#import <UIKit/UIViewController.h>
#import <UIKit/UINavigationController.h>

@implementation WJDJumpManager

+ (void)jumpWithJumpType:(WJDJumpType)jumpType SourceVC:(UIViewController *)sourceVC Param:(nullable NSDictionary *)param {
    
    if (!sourceVC) {
        return;
    }
    NSString *vcName;
    switch (jumpType) {
        case WJDJumpType_demo://实例控制器
        {
            vcName = @"DemoViewController";
        }
            break;
        case WJDJumpType_first://控制器
        {
            vcName = @"FirstViewController";
        }
            break;
        case WJDJumpType_second://控制器
        {
            vcName = @"SecondViewController";
        }
            break;
        default:
            break;
    }
    
    if (vcName) {
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        if (param) {
            for (NSString *key in param.allKeys) {
                [vc setValue:param[key] forKey:key];
            }
        }
        [sourceVC.navigationController pushViewController:vc animated:YES];
    }
}

@end
