//
//  WJDImageProducer.m
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/17.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import "WJDImageProducer.h"

@implementation WJDImageProducer

static NSCache *__imageProducerCache;

#pragma mark - 绘制太极图
+ (UIImage *)taijiImageWithDirection:(TaiJiDirection)direction Size:(CGSize)size {
    
    if (size.width <= 0 || size.height <= 0) {
        return nil;
    }
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef ref = UIGraphicsGetCurrentContext();
    //矩形变换（需要在画图之前）
    if (direction != TaiJiDirection_0) {
        CGFloat width  = direction != TaiJiDirection_3 ? size.width  : 0;
        CGFloat height = direction != TaiJiDirection_1 ? size.height : 0;
        CGContextTranslateCTM(ref, width, height);
        CGContextRotateCTM(ref, M_PI_2*direction);
    }
    //大圆
    CGFloat bigX = size.width*0.5;
    CGFloat bigY = size.height*0.5;
    CGFloat bigRadius = (MIN(size.width,size.height)-2)*0.5;
    CGContextSetLineWidth(ref, 1.0);
    CGContextAddArc(ref, bigX, bigY, bigRadius, 0, M_PI*2, 0);
    [[UIColor blackColor] set];
    CGContextStrokePath(ref);
    //上半圆（黑）
    CGContextAddArc(ref, bigX, bigY, bigRadius, M_PI, M_PI*2, 0);
    [[UIColor blackColor] set];
    CGContextFillPath(ref);
    //下半圆 (白)
    CGContextAddArc(ref, bigX, bigY, bigRadius, 0, M_PI, 0);
    [[UIColor whiteColor] set];
    CGContextFillPath(ref);
    //左圆 (黑)
    CGContextAddArc(ref, bigX-bigRadius*0.5, bigY, bigRadius*0.5, 0, M_PI*2, 0);
    [[UIColor blackColor] set];
    CGContextFillPath(ref);
    //右圆（白）
    CGContextAddArc(ref, bigX+bigRadius*0.5, bigY, bigRadius*0.5, 0, M_PI*2, 0);
    [[UIColor whiteColor] set];
    CGContextFillPath(ref);
    
    CGFloat smallCircleRadius = size.width*5.0f/100.0f;
    //左小圆（白）
    CGContextAddArc(ref, bigX-bigRadius*0.5, bigY, smallCircleRadius, 0, M_PI*2, 0);
    [[UIColor whiteColor] set];
    CGContextFillPath(ref);
    //右小圆 (黑)
    CGContextAddArc(ref, bigX+bigRadius*0.5, bigY, smallCircleRadius, 0, M_PI*2, 0);
    [[UIColor blackColor] set];
    CGContextFillPath(ref);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
#pragma mark - 绘制箭头图片
+ (UIImage *)arrowImageWithDirection:(ArrowDirection)direction
                                Size:(CGSize)size
                               Width:(CGFloat)lineWidth
                               Color:(UIColor *)lineColor
                            NickName:(NSString *)lineColorNickName {
    
    if (size.width <= 0 || size.height <= 0) {
        return nil;
    }
    //生成图片在缓存中的key
    NSString *imageKey = [NSString stringWithFormat:@"arrow_%li_%@_%.2f_%@",direction,NSStringFromCGSize(size),lineWidth,lineColorNickName];
    //如果缓存中存在该图片直接返回该图片
    if (__imageProducerCache) {
        UIImage *image = [__imageProducerCache objectForKey:imageKey];
        if (image) {
            return image;
        }
    }
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef ref = UIGraphicsGetCurrentContext();
    //first为顶点 second为顶点向上时左边那个点  third为顶点向上时右边那个点
    CGFloat firstX,firstY,secondX,secondY,thirdX,thirdY;
    switch (direction) {
        case ArrowDirection_left:
        {
            firstX  = 0.0f;
            firstY  = size.height*0.5;
            secondX = size.width;
            secondY = size.height;
            thirdX  = size.width;
            thirdY  = 0.0f;
        }
            break;
        case ArrowDirection_up:
        {
            firstX  = size.width*0.5;
            firstY  = 0.0f;
            secondX = 0.0f;
            secondY = size.height;
            thirdX  = size.width;
            thirdY  = size.height;
        }
            break;
        case ArrowDirection_right:
        {
            firstX  = size.width;
            firstY  = size.height*0.5;
            secondX = 0.0f;
            secondY = 0.0f;
            thirdX  = 0.0f;
            thirdY  = size.height;
        }
            break;
        case ArrowDirection_down:
        {
            firstX  = size.width*0.5;
            firstY  = size.height;
            secondX = size.width;
            secondY = 0.0f;
            thirdX  = 0.0f;
            thirdY  = 0.0f;
        }
            break;
    }
    CGContextSetLineWidth(ref, lineWidth <= 0 ? 1.0f : lineWidth);
    CGContextMoveToPoint(ref, secondX, secondY);
    CGContextAddLineToPoint(ref, firstX, firstY);
    CGContextAddLineToPoint(ref, thirdX, thirdY);
    lineColor ? [lineColor set] : [[UIColor whiteColor] set];
    CGContextStrokePath(ref);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //将生成的图片加入缓存
    if (image) {
        if (!__imageProducerCache) {
            __imageProducerCache = [[NSCache alloc]init];
        }
        [__imageProducerCache setObject:image forKey:imageKey];
    }
    UIGraphicsEndImageContext();
    return image;
}

@end
