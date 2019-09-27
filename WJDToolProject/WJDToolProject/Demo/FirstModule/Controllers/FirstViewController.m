//
//  FirstViewController.m
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/16.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import "FirstViewController.h"
#import "WJDBaseSectionModel.h"
#import "FirstTableViewCellModel.h"
#import "FirstTableViewCell.h"


@interface FirstViewController ()<FirstTableViewCellDelegate>

@end

@implementation FirstViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self loadData];
}
- (void)loadData {
    
    [self.datas removeAllObjects];
    WJDBaseSectionModel *sectionModel = [[WJDBaseSectionModel alloc]init];
    for (NSInteger i = 0; i < 6; i++) {
        FirstTableViewCellModel *cellModel = [[FirstTableViewCellModel alloc]init];
        [sectionModel.cellDatas addObject:cellModel];
    }
    [self.datas addObject:sectionModel];
    [self.tableView reloadData];
}
#pragma mark - FirstTableViewCellDelegate
- (void)startButtonClick:(UIButton *)btn {
    NSLog(@"startButtonClick");
}
- (void)stopButtonClick:(UIButton *)btn {
    NSLog(@"stopButtonClick");
}
@end
