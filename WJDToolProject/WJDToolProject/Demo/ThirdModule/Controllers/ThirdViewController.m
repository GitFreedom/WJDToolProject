//
//  ThirdViewController.m
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/17.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import "ThirdViewController.h"
#import "WJDImageProducer.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    CGFloat itemWidth = self.view.frame.size.width * 0.25;
    CGFloat itemX     = (self.view.frame.size.width - itemWidth)*0.5;
    for (NSInteger i = 0; i < 4; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(itemX, (itemWidth + 15)*i, itemWidth, itemWidth)];
        imageView.image = [WJDImageProducer taijiImageWithDirection:TaiJiDirection_0 + i Size:imageView.frame.size];
        [self.view addSubview:imageView];
    }
}

@end
