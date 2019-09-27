//
//  WJDBaseCellModel.h
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/8.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

NS_ASSUME_NONNULL_BEGIN

@interface WJDBaseCellModel : NSObject

/**
 *  cell名称
 */
@property (nonatomic, copy  ) NSString *className;
/**
 *  cell高度
 */
@property (nonatomic, assign) CGFloat  cellHeight;

@end

NS_ASSUME_NONNULL_END
