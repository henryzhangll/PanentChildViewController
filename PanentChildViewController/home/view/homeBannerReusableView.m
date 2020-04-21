//
//  homeReusableView.m
//  Project
//
//  Created by henryzhang on 2019/9/18.
//  Copyright © 2019 clubcard. All rights reserved.
//

#import "homeBannerReusableView.h"
#define leftright 10.f
#define topBottom 0.f
@interface homeBannerReusableView ()

/**
 *  轮播图
 */
@property (nonatomic, strong) UIPageControl *pageC;
@property (nonatomic, strong) UIView *parView; // 轮播图父容器
@property (nonatomic, strong) UIScrollView *scrollView; // 轮播图容器
@property (nonatomic, strong) NSTimer *timer ;
@property (nonatomic, assign) int page ;

@end

@implementation homeBannerReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setBannerArray:(NSArray *)bannerArray
{
    _bannerArray = bannerArray;
    if (_scrollView && _pageC && _parView) {
        [self.pageC removeFromSuperview];
        [self.scrollView removeFromSuperview];
        [self.parView removeFromSuperview];
        for (UIView *view in self.scrollView.subviews) {
            [view removeFromSuperview];
        }
        [self stopTimer];
    }
    CGFloat h = [homeBannerReusableView returnCellHeifht];
    self.parView = [[UIView alloc] initWithFrame:CGRectMake(10.f, 10.f, kScreenWidth-20.f, h)];
    self.parView.userInteractionEnabled = YES ;
    [self addSubview:self.parView];
    
    CGFloat width = kScreenWidth-20.f ;
    self.scrollView.contentSize = CGSizeMake(width*bannerArray.count, h);
    [self.parView addSubview:self.scrollView];
    
    for (int i = 0; i < bannerArray.count; i++) {
        NSString *title = [bannerArray objectAtIndex:i];
        CGFloat h = [homeBannerReusableView returnCellHeifht];
        
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(width * i, 0, kScreenWidth-20.f, h-20.f)];
        view.tag = i ;
        view.layer.masksToBounds = YES ;
        view.layer.cornerRadius = 5.f;
        view.userInteractionEnabled = YES ;
        
        view.backgroundColor = [UIColor greenColor];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemSelected:)];
        [view addGestureRecognizer:tap];
        [self.scrollView addSubview:view];
    }
    
    self.pageC.numberOfPages = bannerArray.count ;
    self.pageC.currentPage = 0 ;
    self.page = 0 ;
    [self addSubview:self.pageC];
    if (bannerArray.count > 1) {
        [self startTimer];
    }
}

- (void)itemSelected:(UITapGestureRecognizer *)tap {
    UIView *view = tap.view ;
    int index = (int)view.tag ;
    
}

- (void)startTimer {
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3.f target:self selector:@selector(autoNextPage) userInfo:nil repeats:YES];
    self.timer = timer;
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer {
    
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

#pragma mark --自动轮播
- (void)autoNextPage {
    
    self.page ++;
    if (self.page > (self.bannerArray.count - 1)) {
        self.page = 0 ;
    }
    [self.scrollView setContentOffset:CGPointMake(self.page * (kScreenWidth-20.f), 0) animated:self.page == 0 ? NO : YES];
}

#pragma mark -- 轮播图
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        CGFloat h = [homeBannerReusableView returnCellHeifht];
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0.f, 0.f, kScreenWidth-20.f, h)];
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.delegate = self;
        _scrollView.tag = 5201314 ;
        _scrollView.pagingEnabled = YES;
        _scrollView.userInteractionEnabled = YES ;
    }
    return _scrollView;
}

- (UIPageControl *)pageC
{
    if (!_pageC) {
        //初始化pageControl
        CGFloat h = [homeBannerReusableView returnCellHeifht];
        _pageC = [[UIPageControl alloc] initWithFrame:CGRectMake(10, h-30.f, kScreenWidth-20.f, 10.f)];
    }
    return _pageC;
}

#pragma mark --将要开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self stopTimer];
}

#pragma mark --结束拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self startTimer];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int pageIndex = (int)round(_scrollView.contentOffset.x / (kScreenWidth-20.f)) % self.bannerArray.count;
    [self.pageC setCurrentPage:pageIndex];
    _page = pageIndex;
}

//解决当父View释放时，当前视图因为被Timer强引用而不能释放的问题
- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (!newSuperview) {
        [self stopTimer];
    }
}

- (void)dealloc
{
    self.scrollView.delegate = nil;
    [self stopTimer];
}

+ (CGFloat) returnCellHeifht {
    return (100.f * kScreenWidth) / 343.f + 20.f;
}
@end
