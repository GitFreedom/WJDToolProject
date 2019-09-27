//
//  WJDBaseSectionModel.h
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/8.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

NS_ASSUME_NONNULL_BEGIN
@class WJDBaseCellModel;
@interface WJDBaseSectionModel : NSObject

/**
 *  sectionHeaderClass
 */
@property (nonatomic, copy  ) NSString *headerClassName;
/**
 *  sectionFooterClass
 */
@property (nonatomic, copy  ) NSString *footerClassName;
/**
 *  sectionHeaderHeight (默认值CGFLOAT_MIN)
 */
@property (nonatomic, assign) CGFloat   headerHeight;
/**
 *  sectionFooterHeight (默认值CGFLOAT_MIN)
 */
@property (nonatomic, assign) CGFloat   footerHeight;
/**
 *  cell数组 （默认初始化）
 */
@property (nonatomic, strong) NSMutableArray<WJDBaseCellModel *> *cellDatas;

@end

NS_ASSUME_NONNULL_END
