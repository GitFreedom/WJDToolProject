//
//  SecondViewController.m
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/16.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import "SecondViewController.h"
#import "WJDLoopScrollView.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    WJDLoopScrollView *loopScrollView = [[WJDLoopScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.width)];
    NSMutableArray *pages = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < 6; i++) {
        UILabel *view = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, loopScrollView.frame.size.width, loopScrollView.frame.size.height)];
        view.textColor = [UIColor whiteColor];
        view.textAlignment = NSTextAlignmentCenter;
        view.text = [NSString stringWithFormat:@"%li",i];
        switch (i) {
            case 0:
            {
                view.backgroundColor = [UIColor blackColor];
            }
                break;
            case 1:
            {
                view.backgroundColor = [UIColor redColor];
            }
                break;
            case 2:
            {
                view.backgroundColor = [UIColor lightGrayColor];
            }
                break;
            case 3:
            {
                view.backgroundColor = [UIColor blueColor];
            }
                break;
            case 4:
            {
                view.backgroundColor = [UIColor orangeColor];
            }
                break;
            case 5:
            {
                view.backgroundColor = [UIColor grayColor];
            }
                break;
            default:
                break;
        }
        [pages addObject:view];
    }
    [self.view addSubview:loopScrollView];
    [loopScrollView loadPages:pages.copy];
}

@end
