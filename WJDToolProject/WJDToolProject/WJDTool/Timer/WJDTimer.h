//
//  WJDTimer.h
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/14.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//拷贝YYTimer
@interface WJDTimer : NSObject

+ (WJDTimer *)timerWithTimeInterval:(NSTimeInterval)interval
                             target:(id)target
                           selecter:(SEL)selector
                           repeats:(BOOL)repeats;

- (instancetype)initWithFireTime:(NSTimeInterval)fireTime
                    timeInterval:(NSTimeInterval)interval
                          target:(id)target
                        selector:(SEL)selector
                        repeats:(BOOL)repeats NS_DESIGNATED_INITIALIZER;

@property (readonly) BOOL repeats;
@property (readonly) NSTimeInterval timeInterval;
@property (readonly, getter=isValid) BOOL valid;

- (void)invalidate;

- (void)fire;

@end

NS_ASSUME_NONNULL_END
