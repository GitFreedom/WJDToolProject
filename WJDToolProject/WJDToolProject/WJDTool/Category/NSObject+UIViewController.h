//
//  NSObject+UIViewController.h
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/8.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewController;

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (UIViewController)

+ (UIViewController *)getCurrentVC;

@end

NS_ASSUME_NONNULL_END
