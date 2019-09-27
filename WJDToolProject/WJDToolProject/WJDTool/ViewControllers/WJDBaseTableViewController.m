//
//  WJDBaseTableViewController.m
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/9.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import "WJDBaseTableViewController.h"
#import "WJDDevice.h"
#import "WJDBaseSectionModel.h"
#import "WJDBaseCellModel.h"
#import <UIKit/UITableViewHeaderFooterView.h>
#import "WJDBaseTableViewCell.h"

@interface WJDBaseTableViewController ()

@end

@implementation WJDBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
#pragma mark - delegate
#pragma mark   UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.datas.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.datas[section].cellDatas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WJDBaseCellModel *cellModel = self.datas[indexPath.section].cellDatas[indexPath.row];
    if (cellModel.className && cellModel.className.length > 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellModel.className];
        if (!cell) {
            Class cellClass = NSClassFromString(cellModel.className);
            if ([[cellClass new] isKindOfClass:[UITableViewCell class]]) {
                cell = [[cellClass alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellModel.className];
            }
            else {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellModel.className];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        if ([cell isKindOfClass:[WJDBaseTableViewCell class]]) {
            [cell setValue:cellModel forKey:@"data"];
            [cell setValue:self  forKey:@"delegate"];
        }
        return cell;
    }
    return [UITableViewCell new];
}
#pragma mark   UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    WJDBaseSectionModel *sectionHeaderModel = self.datas[section];
    if (sectionHeaderModel.headerClassName && sectionHeaderModel.headerClassName.length > 0) {
        UITableViewHeaderFooterView *sectionHeader = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionHeaderModel.headerClassName];
        if (!sectionHeader) {
            Class sectionHeaderClass = NSClassFromString(sectionHeaderModel.headerClassName);
            if ([sectionHeaderClass isKindOfClass:[UITableViewHeaderFooterView class]]) {
                sectionHeader = [[sectionHeaderClass alloc]initWithReuseIdentifier:sectionHeaderModel.headerClassName];
            }
            else {
                sectionHeader = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:sectionHeaderModel.headerClassName];
            }
        }
        return sectionHeader;
    }
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    WJDBaseSectionModel *sectionFooterModel = self.datas[section];
    if (sectionFooterModel.footerClassName && sectionFooterModel.footerClassName.length > 0) {
        UITableViewHeaderFooterView *sectionFooter = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionFooterModel.footerClassName];
        if (!sectionFooter) {
            Class sectionFooterClass = NSClassFromString(sectionFooterModel.footerClassName);
            if ([sectionFooterClass isKindOfClass:[UITableViewHeaderFooterView class]]) {
                sectionFooter = [[sectionFooterClass alloc]initWithReuseIdentifier:sectionFooterModel.footerClassName];
            }
            else {
                sectionFooter = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:sectionFooterModel.footerClassName];
            }
        }
        return sectionFooter;
    }
    return [UIView new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.datas[indexPath.section].cellDatas[indexPath.row].cellHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return self.datas[section].headerHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return self.datas[section].footerHeight;
}
#pragma mark - getter
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate            = self;
        _tableView.dataSource          = self;
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, WJDDevice.bottomOffset, 0);
        if (WJDDevice.systemVersion >= 11.0f) {
#ifdef __IPHONE_11_0
            if (@available(iOS 11.0 ,*)) {
                _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }
#endif
        }
        _tableView.separatorStyle      = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
- (NSMutableArray<WJDBaseSectionModel *> *)datas {
    
    if (!_datas) {
        _datas = [[NSMutableArray alloc]init];
    }
    return _datas;
}
#pragma mark - setter
- (void)setBlankType:(WJDBlankType)blankType {
    
    super.blankType = blankType;
    [self showBlankWithFrame:CGRectZero Type:blankType view:self.tableView];
}
#pragma mark - overWriteMethod
- (void)setupViews {
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    if (self.navigationStatus != NavigationStatus_hidden) {
        height -= ([WJDDevice statusBarHeight] + 44);
    }
    if (self.tabbarStatus != TabbarStatus_hidden) {
        if (self.tabbarStatus == TabbarStatus_show) {
            height -= ([WJDDevice bottomOffset] + 49);
        }
        else {
            if (self.navigationController.viewControllers.count <= 1) {
                height -= ([WJDDevice bottomOffset] + 49);
            }
        }
    }
    self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, height);
    [self.view addSubview:self.tableView];
}

@end
