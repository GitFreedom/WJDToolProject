//
//  WJDUserManager.h
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/11.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WJDUserManager : NSObject

/**
 *  已经显示过引导页了
 */
@property (nonatomic, assign) BOOL     alreadyShowRootPage;

+ (WJDUserManager *)sharedManager;

/**
 *  加载主页
 */
+ (void)launchRootVC;

/**
 *  将userInfo归档到本地
 */
- (void)archiveUserInfoTolocal;

/**
 *  清空userInfo的信息
 */
- (void)clearUserInfo;

@end

NS_ASSUME_NONNULL_END
