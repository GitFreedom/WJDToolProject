//
//  FirstTableViewCellModel.m
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/16.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import "FirstTableViewCellModel.h"

@implementation FirstTableViewCellModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.className  = @"FirstTableViewCell";
        self.cellHeight = 60;
    }
    return self;
}

@end
