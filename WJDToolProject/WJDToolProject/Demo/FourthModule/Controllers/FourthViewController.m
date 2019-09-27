//
//  FourthViewController.m
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/17.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import "FourthViewController.h"
#import "WJDImageProducer.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    CGFloat width = self.tableView.frame.size.width * 0.8;
    CGFloat x     = self.tableView.frame.size.width * 0.1;
    CGFloat y     = (self.tableView.frame.size.height - width)*0.5;
    UIImageView *taijiImageView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, width, width)];
    taijiImageView.image = [WJDImageProducer taijiImageWithDirection:TaiJiDirection_0 Size:CGSizeMake(width, width)];
    [self.tableView addSubview:taijiImageView];
    
    CABasicAnimation *animation =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
                                    
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    
    animation.fromValue = [NSNumber numberWithFloat:M_PI *2];
    
    animation.toValue =  [NSNumber numberWithFloat:0.f];
    
    animation.duration  = 1.5f;
    
    animation.autoreverses = NO;
    
    animation.fillMode =kCAFillModeForwards;
    
    animation.repeatCount = MAXFLOAT; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    
    animation.removedOnCompletion = NO;
    
    [taijiImageView.layer addAnimation:animation forKey:nil];
}

@end
