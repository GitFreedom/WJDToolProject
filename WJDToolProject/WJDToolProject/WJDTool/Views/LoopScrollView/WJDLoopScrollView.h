//
//  WJDLoopScrollView.h
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/14.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WJDLoopScrollView : UIView

/**
 *  加载视图
 */
- (void)loadPages:(NSArray<UIView *>*)pages;

@end

NS_ASSUME_NONNULL_END
