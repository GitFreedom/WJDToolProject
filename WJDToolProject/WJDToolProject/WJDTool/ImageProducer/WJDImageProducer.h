//
//  WJDImageProducer.h
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/17.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TaiJiDirection) {
    TaiJiDirection_0 = 0,//跟图标上的一样
    TaiJiDirection_1,//图标顺时针旋转90度
    TaiJiDirection_2,//图标顺时针旋转180度
    TaiJiDirection_3,//图标顺时针旋转270度
};
typedef NS_ENUM(NSInteger, ArrowDirection) {
    ArrowDirection_left = 0,//箭头向左
    ArrowDirection_up,//箭头向上
    ArrowDirection_right,//箭头向右
    ArrowDirection_down//箭头向下
};
NS_ASSUME_NONNULL_BEGIN

@interface WJDImageProducer : NSObject
/**
 *  @brief  : 根据方向和尺寸绘制太极图片
 *  @param    direction 太极图方向
 *  @param    size      太极图尺寸
 *  @return : 返回绘制好的图片
 */
+ (UIImage *)taijiImageWithDirection:(TaiJiDirection)direction Size:(CGSize)size;
/**
 *  @brief  : 根据方向、尺寸、线颜色、线宽度绘制箭头图片
 *  @param    direction 箭头方向
 *  @param    size      箭头大小
 *  @param    lineWidth 箭头线宽度
 *  @param    lineColor 箭头颜色
 *  @param    lineColorNickName 箭头颜色别名用来缓存生成的图片
 *  @return : 返回绘制好的图片
 */
+ (UIImage *)arrowImageWithDirection:(ArrowDirection)direction
                                Size:(CGSize)size
                               Width:(CGFloat)lineWidth
                               Color:(UIColor *)lineColor
                            NickName:(NSString *)lineColorNickName;
@end

NS_ASSUME_NONNULL_END
