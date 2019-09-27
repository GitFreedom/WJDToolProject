//
//  WJDLoopScrollView.m
//  WJDToolProject
//
//  Created by 王俊东 on 2019/1/14.
//  Copyright © 2019年 www.wangjundong.com. All rights reserved.
//

#import "WJDLoopScrollView.h"
#import "UIView+Frame.h"

@interface WJDLoopScrollView ()<UIScrollViewDelegate>

/**
 *  滑动视图
 */
@property (nonatomic, weak  ) UIScrollView *scrollView;
/**
 *  视图
 */
@property (nonatomic, strong) NSMutableArray<UIView *> *pages;

/**
 *  当前页
 */
@property (nonatomic, assign) NSInteger currentPage;

@end

@implementation WJDLoopScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        _pages       = [[NSMutableArray alloc]init];
        //滑动视图
        UIScrollView *scrollView = [[UIScrollView alloc]init];
        scrollView.showsVerticalScrollIndicator   = NO;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.pagingEnabled                  = YES;
        scrollView.delegate = self;
        _scrollView = scrollView;
        [self addSubview:_scrollView];
    }
    return self;
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    NSLog(@"scrollView.contentOffset = %@", NSStringFromCGPoint(scrollView.contentOffset));
    if ( scrollView.contentOffset.x < 0 ) {
        self.currentPage = [self __validatePageIndex:self.currentPage - 1];;
        [self updatePages];
    }
    else if ( scrollView.contentOffset.x > scrollView.width * 2 ) {
        self.currentPage = [self __validatePageIndex:self.currentPage + 1];
        [self updatePages];
    }
}
#pragma mark - publicMethod
- (void)loadPages:(NSArray<UIView *>*)pages {
    
    self.scrollView.frame = self.bounds;
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.pages removeAllObjects];
    self.scrollView.contentOffset = CGPointZero;
    self.scrollView.contentSize   = CGSizeZero;
    if ( !pages || pages.count <= 0 ) {
        return;
    }
    [self.pages addObjectsFromArray:pages];
    if (self.pages.count == 1) {
        [self.scrollView addSubview:self.pages[0]];
        self.scrollView.contentSize = self.pages[0].frame.size;
    }
    else {
        self.scrollView.contentSize = CGSizeMake(self.width*3, self.height);
        [self updatePages];
    }
}
#pragma mark - privateMethod
- (NSInteger)__validatePageIndex:(NSInteger)pageIndex {
    
    if (pageIndex < 0) {
        return self.pages.count - 1;
    }
    else if (pageIndex >= self.pages.count) {
        return 0;
    }
    return pageIndex;
}
- (void)updatePages {
    
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UIView *leftView = self.pages[[self __validatePageIndex:self.currentPage - 1]];
    CGFloat leftX    = (self.width - leftView.width)*0.5;
    leftView.frame   = CGRectMake(leftX, 0, leftView.width, leftView.height);
    [self.scrollView addSubview:leftView];
    
    UIView *centerView = self.pages[self.currentPage];
    CGFloat centerX    = (self.width - centerView.width)*0.5 + self.width;
    centerView.frame   = CGRectMake(centerX, 0, centerView.width, centerView.height);
    [self.scrollView addSubview:centerView];
    
    UIView *rightView = self.pages[[self __validatePageIndex:self.currentPage + 1]];
    CGFloat rightX    = (self.width - centerView.width)*0.5 + self.width*2;
    rightView.frame   = CGRectMake(rightX, 0, rightView.width, rightView.height);
    [self.scrollView addSubview:rightView];
    
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.width, 0) animated:NO];
    
}
@end
