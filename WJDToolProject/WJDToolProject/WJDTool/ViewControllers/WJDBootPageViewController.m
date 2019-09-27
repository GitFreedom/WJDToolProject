//
//  WJDBootPageViewController.m
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/11.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import "WJDBootPageViewController.h"
#import "WJDDevice.h"
#import "WJDUserManager.h"
#import "UIView+Frame.h"
#import "WJDImageProducer.h"

@interface WJDBootPageViewController ()

@end

@implementation WJDBootPageViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self __setupViews];
}
#pragma mark - privateMethod
- (void)__setupViews {
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    NSArray<NSString *> *pageImagesArray = [self pageImages];
    for (NSInteger i = 0; i < pageImagesArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(scrollView.width * i, 0, scrollView.width, scrollView.height - 113)];
//        imageView.image = [UIImage imageNamed:pageImagesArray[i]];
//        imageView.contentMode  = UIViewContentModeScaleAspectFit;
        imageView.image        = [WJDImageProducer taijiImageWithDirection:i Size:CGSizeMake(scrollView.width * 0.68, scrollView.width  * 0.68)];
        imageView.contentMode  = UIViewContentModeCenter;
        [scrollView addSubview:imageView];
        if (i == pageImagesArray.count - 1 ) {
            imageView.userInteractionEnabled = YES;
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"立即体验" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.titleLabel.font     = [UIFont systemFontOfSize:15.0f];
            button.layer.cornerRadius  = 5.0f;
            button.layer.masksToBounds = YES;
            button.backgroundColor     = [UIColor blackColor];
            [button addTarget:self action:@selector(sureButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            CGFloat buttonWidth = SCREEN_WIDTH*316.0f/375.0f;
            button.frame = CGRectMake(scrollView.width * i + (scrollView.width - buttonWidth)*0.5, scrollView.height - WJDDevice.bottomOffset - 55.0f - 49.0f, buttonWidth, 55.0f);
            [scrollView addSubview:button];
        }
    }
    scrollView.showsVerticalScrollIndicator   = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.contentSize   = CGSizeMake(scrollView.width * pageImagesArray.count, scrollView.height);
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
}
- (NSArray<NSString *> *)pageImages {
    
    return @[
             @"BootPage0",
             @"BootPage1",
             @"BootPage2",
             @"BootPage3",
             ];
}
#pragma mark - Action
- (void)sureButtonClick:(UIButton *)btn {
    
    btn.enabled = NO;
    [WJDUserManager sharedManager].alreadyShowRootPage = YES;
    [[WJDUserManager sharedManager] archiveUserInfoTolocal];
    [WJDUserManager launchRootVC];
    btn.enabled = YES;
}
#pragma mark - overwriteMethod
- (BOOL)prefersStatusBarHidden {
    
    return YES;
}

@end
