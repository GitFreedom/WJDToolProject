//
//  FirstTableViewCell.m
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/16.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import "FirstTableViewCell.h"
#import "UIView+Frame.h"

@interface FirstTableViewCell ()
/**
 *  开始按钮
 */
@property (nonatomic, weak  ) UIButton *startButton;
/**
 *  停止按钮
 */
@property (nonatomic, weak  ) UIButton *stopButton;

@end

@implementation FirstTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //开始按钮
        UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        startButton.layer.cornerRadius  = 8.0f;
        startButton.layer.masksToBounds = YES;
        startButton.layer.borderColor   = [UIColor blueColor].CGColor;
        startButton.layer.borderWidth   = 1.0f;
        startButton.titleLabel.font     = [UIFont systemFontOfSize:15.0f];
        [startButton setTitle:@"开始按钮" forState:UIControlStateNormal];
        [startButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [startButton addTarget:self action:@selector(startButtonClick) forControlEvents:UIControlEventTouchUpInside];
        _startButton                    = startButton;
        [self.contentView addSubview:_startButton];
        //停止按钮
        UIButton *stopButton = [UIButton buttonWithType:UIButtonTypeCustom];
        stopButton.layer.cornerRadius  = 5.0f;
        stopButton.layer.masksToBounds = YES;
        stopButton.layer.borderColor   = [UIColor blueColor].CGColor;
        stopButton.layer.borderWidth   = 1.0f;
        stopButton.titleLabel.font     = [UIFont systemFontOfSize:15.0f];
        [stopButton setTitle:@"停止按钮" forState:UIControlStateNormal];
        [stopButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [stopButton addTarget:self action:@selector(stopButtonClick) forControlEvents:UIControlEventTouchUpInside];
        _stopButton                    = stopButton;
        [self.contentView addSubview:_stopButton];
        
        self.startButton.frame = CGRectMake(15, 10, 120, 40);
        self.stopButton.frame  = CGRectMake(self.startButton.maxX + 15, self.startButton.y, self.startButton.width, self.startButton.height);
    }
    return self;
}
#pragma mark - Action
- (void)startButtonClick {
    
    if ([self.delegate respondsToSelector:@selector(startButtonClick:)]) {
        [self.delegate startButtonClick:self.startButton];
    }
}
- (void)stopButtonClick {
    
    if ([self.delegate respondsToSelector:@selector(stopButtonClick:)]) {
        [self.delegate stopButtonClick:self.stopButton];
    }
}
@end
