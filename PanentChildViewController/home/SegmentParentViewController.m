//
//  SegmentViewController.m
//  PersonalCenter
//
//  Created by Arch on 2017/6/16.
//  Copyright © 2017年 mint_bin. All rights reserved.
//

#import "SegmentParentViewController.h"

@interface SegmentParentViewController () <UICollectionViewDataSource, UIScrollViewDelegate>

/**mainTableView是否可以滚动*/
@property (nonatomic, assign) BOOL canScroll;
/**segmentHeaderView到达顶部, mainTableView不能移动*/
@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabView;
/**segmentHeaderView离开顶部,childViewController的滚动视图不能移动*/
@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabViewPre;
@end

@implementation SegmentParentViewController
#pragma mark - Life
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册允许外层tableView滚动通知-解决和分页视图的上下滑动冲突问题
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptMsg:) name:@"leaveTop" object:nil];
    //分页的scrollView左右滑动的时候禁止mainTableView滑动，停止滑动的时候允许mainTableView滑动
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptMsg:) name:IsEnablePersonalCenterVCMainTableViewScroll object:nil];
    
    self.canScroll = YES;
    self.isTopIsCanNotMoveTabView = NO;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self scrollParanetViewDidScroll:scrollView];
    //当前偏移量
    CGFloat yOffset  = scrollView.contentOffset.y;
    //临界点偏移量(吸顶临界点)
    CGFloat tabyOffset = self.tabyOffset;//350.f;
    //利用contentOffset处理内外层scrollView的滑动冲突问题
    if (yOffset >= tabyOffset) {
        scrollView.contentOffset = CGPointMake(0, tabyOffset);
        self.isTopIsCanNotMoveTabView = YES;
    }else{
        self.isTopIsCanNotMoveTabView = NO;
    }
    
    self.isTopIsCanNotMoveTabViewPre = !self.isTopIsCanNotMoveTabView;
    
    if (!self.isTopIsCanNotMoveTabViewPre) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"goTop" object:nil userInfo:@{@"canScroll":@"1"}];
        self.canScroll = NO;
    }else {
        if (!self.canScroll) {
            self.myCollectionView.contentOffset = CGPointMake(0, tabyOffset);
        }else {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"goTop" object:nil userInfo:@{@"canScroll":@"0"}];
        }
    }
}

- (void)scrollParanetViewDidScroll:(UIScrollView *)scrollView {
    
}

#pragma mark -  Notification
- (void)acceptMsg:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    
    if ([notification.name isEqualToString:@"leaveTop"]) {
        NSString *canScroll = userInfo[@"canScroll"];
        if ([canScroll isEqualToString:@"1"]) {
            self.canScroll = YES;
        }
    } else if ([notification.name isEqualToString:IsEnablePersonalCenterVCMainTableViewScroll]) {
        NSString *canScroll = userInfo[@"canScroll"];
        if ([canScroll isEqualToString:@"1"]) {
            self.myCollectionView.scrollEnabled = YES;
        }else if([canScroll isEqualToString:@"0"]) {
            self.myCollectionView.scrollEnabled = NO;
        }
    }
}

@end
