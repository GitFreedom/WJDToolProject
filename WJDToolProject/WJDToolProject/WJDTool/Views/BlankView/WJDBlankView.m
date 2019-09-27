//
//  WJDBlankView.m
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/8.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import "WJDBlankView.h"

@interface WJDBlankView ()

/**
 *  提示标签
 */
@property (nonatomic, weak  ) UILabel *tipLabel;
/**
 *  默认字体
 */
@property (nonatomic, strong) UIFont  *defaultFont;
/**
 *  默认字体颜色
 */
@property (nonatomic, strong) UIColor *defaultColor;
/**
 *  高亮字体颜色
 */
@property (nonatomic, strong) UIColor *highlightColor;

@end

@implementation WJDBlankView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _defaultFont    = [UIFont systemFontOfSize:15.0f];
        _defaultColor   = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        _highlightColor = [UIColor colorWithRed:224/255.0 green:36/255.0  blue:36/255.0  alpha:1.0];
        
        //提示标签
        UILabel *tipLabel      = [UILabel new];
        _tipLabel              = tipLabel;
        [self addSubview:_tipLabel];
        
    }
    return self;
}
#pragma mark - setter
- (void)setBlankType:(WJDBlankType)blankType {
    
    switch (blankType) {
        case WJDBlankType_unknow:
        {
            
        }
            break;
            
        default:
            break;
    }
}
#pragma mark - Action
- (void)__tapAction {
    
    if ([self.delegate respondsToSelector:@selector(blankViewTapAction)]) {
        [self.delegate blankViewTapAction];
    }
}

@end
