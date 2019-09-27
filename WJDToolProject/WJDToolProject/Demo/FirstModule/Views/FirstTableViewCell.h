//
//  FirstTableViewCell.h
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/16.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import "WJDBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FirstTableViewCellDelegate <NSObject>

@optional
- (void)startButtonClick:(UIButton *)btn;
- (void)stopButtonClick:(UIButton *)btn;

@end

@interface FirstTableViewCell : WJDBaseTableViewCell

@end

NS_ASSUME_NONNULL_END
