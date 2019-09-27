//
//  WJDUserInfo.m
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/11.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import "WJDUserInfo.h"
#import <objc/runtime.h>

@implementation WJDUserInfo

- (void)encodeWithCoder:(NSCoder *)coder {
    
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(self.class, &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        [coder encodeObject:[self valueForKey:key] forKey:key];
    }
    free(ivarList);
}
- (instancetype)initWithCoder:(NSCoder *)coder {
    
    self = [super init];
    if (self) {
        unsigned int count = 0;
        Ivar *ivarList = class_copyIvarList(self.class, &count);
        for (int i = 0; i<count; i++) {
            Ivar var = ivarList[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(var)];
            if ([coder containsValueForKey:key]) {
                [self setValue:[coder decodeObjectForKey:key] forKey:key];
            }
        }
        free(ivarList);
    }
    return self;
}

@end
