//
//  WJDBaseTabBarController.m
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/9.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import "WJDBaseTabBarController.h"
#import "WJDImageProducer.h"

@interface WJDBaseTabBarController ()<UITabBarControllerDelegate>

@end

@implementation WJDBaseTabBarController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.delegate = self;
    [self addchlidVcs];
    
    // 设置tabbar样式
    [self setTabBarItemStyle];
    [[UITabBar appearance] setTranslucent:NO];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    return YES;
}

/**
 *  根据参数, 创建并添加对应的子控制器
 *
 *  @param vc                需要添加的控制器(会自动包装导航控制器)
 *  @param isRequired             标题
 *  @param normalImageName   一般图片名称
 *  @param selectedImageName 选中图片名称
 */
- (void)addChildVC: (UIViewController *)vc  title:(NSString *)title normalImageName: (NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired {
    
    if (isRequired) {
        UINavigationController *nav = [[NSClassFromString(@"WJDBaseNavigationController") alloc] initWithRootViewController:vc];
        vc.navigationItem.title = title;
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[self originImageWithName:normalImageName] selectedImage:[self originImageWithName:selectedImageName]];
        
        [self addChildViewController:nav];
    }
    else {
        [self addChildViewController:vc];
    }
}
- (void)addchlidVcs {
    
    NSArray *vcClassArray = @[@"FirstViewController",@"SecondViewController",@"ThirdViewController",@"FourthViewController",@"FifthViewController"];
    NSArray *vcTitleArray = @[@"金",@"木",@"水",@"火",@"土"];
    for (NSInteger i = 0; i < vcClassArray.count; i++) {
        Class class = NSClassFromString(vcClassArray[i]);
        UIViewController *vc = [class new];
        [self addChildVC:vc title:vcTitleArray[i] normalImageName:[NSString stringWithFormat:@"%li",i] selectedImageName:[NSString stringWithFormat:@"1%li",i] isRequiredNavController:YES];
    }
}

- (void)setTabBarItemStyle {
    
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    
    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:10.0f]} forState:UIControlStateNormal];
    
    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:10.0f]} forState:UIControlStateSelected];
}

- (UIImage *)originImageWithName:(NSString *)imageName {
    
    NSInteger i = [imageName integerValue];
    TaiJiDirection direction = i < 10 ? i : i - 10;
    direction      = direction > TaiJiDirection_3 ? TaiJiDirection_0 : direction;
    CGFloat width  = i < 10 ? 18 : 28;
    UIImage *image = [WJDImageProducer taijiImageWithDirection:direction Size:CGSizeMake(width, width)];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


@end
