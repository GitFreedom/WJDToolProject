//
//  WJDUserManager.m
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/11.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import "WJDUserManager.h"
#import "WJDUserInfo.h"
#import <UIKit/UIKit.h>

@interface WJDUserManager ()

/**
 *  用户信息
 */
@property (nonatomic, strong) WJDUserInfo *userInfo;

@end

@implementation WJDUserManager

@dynamic alreadyShowRootPage;

static WJDUserManager *__userManager = nil;

+ (WJDUserManager *)sharedManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (__userManager == nil) {
            __userManager = [[super allocWithZone:nil]init];
            [__userManager __readUserInfo];
        }
    });
    return __userManager;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    return [WJDUserManager sharedManager];
}
- (instancetype)copyWithZone:(struct _NSZone *)zone {
    
    return [WJDUserManager sharedManager];
}
- (instancetype)mutableCopyWithZone:(struct _NSZone *)zone {
    
    return [WJDUserManager sharedManager];
}
#pragma mark - getter
- (BOOL)alreadyShowRootPage {
    
    return _userInfo.alreadyShowRootPage;
}
#pragma mark - setter
- (void)setAlreadyShowRootPage:(BOOL)alreadyShowRootPage {
    
    _userInfo.alreadyShowRootPage = alreadyShowRootPage;
}
#pragma mark - privateMethod
- (NSString *)__filePath {
    
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    filePath = [filePath stringByAppendingPathComponent:@"WJDUserInfo.data"];
    return filePath;
}
- (void)__readUserInfo {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:[self __filePath]]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _userInfo = [NSKeyedUnarchiver unarchiveObjectWithFile:[self __filePath]];
#pragma clang diagnostic pop
    }
    else {
        _userInfo = [[WJDUserInfo alloc]init];
    }
}
#pragma mark - publicMethod
- (void)archiveUserInfoTolocal {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        [NSKeyedArchiver archiveRootObject:self.userInfo toFile:[self __filePath]];
#pragma clang diagnostic pop
    });
}
- (void)clearUserInfo {
    
    [self archiveUserInfoTolocal];
    [WJDUserManager launchRootVC];
}
//加载主页
+ (void)launchRootVC {
    
    UIViewController *tempVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    if ([WJDUserManager sharedManager].alreadyShowRootPage) {
        Class tabbar = NSClassFromString(@"WJDBaseTabBarController");
        [UIApplication sharedApplication].keyWindow.rootViewController = [tabbar new];
    }
    else {
        UIViewController *bootPageVC = [[NSClassFromString(@"WJDBootPageViewController") alloc]init];
        [UIApplication sharedApplication].keyWindow.rootViewController = bootPageVC;
    }
    if (tempVC) {
        tempVC = nil;
    }
}


@end
