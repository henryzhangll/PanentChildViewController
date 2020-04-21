//
//  homeReusableView.m
//  Project
//
//  Created by henryzhang on 2019/9/18.
//  Copyright © 2019 clubcard. All rights reserved.
//

#import "homeReusableView.h"
#import "Util.h"
#import "HomeListViewController.h"
@interface homeReusableView ()

@end

@implementation homeReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setupTitleView:(UIViewController *)vc titleArray:(nonnull NSArray *)titleArray {
    self.titleArray = [NSMutableArray array];
    for (int i=0; i <titleArray.count; i++) {
        [self.titleArray addObject:[NSString stringWithFormat:@"数组%d",i]];
    }
    
    if (_pageTitleView && _pageContentScrollView) {
        [self.pageTitleView removeFromSuperview];
        [self.pageContentScrollView removeFromSuperview];
    }
    
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.indicatorStyle = SGIndicatorStyleFixed;
    configure.titleFont = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    configure.titleColor = [Util colorWithHexString:@"#333333"];
    configure.titleSelectedFont = [UIFont fontWithName:@"PingFangSC-Medium" size:14];;
    configure.titleSelectedColor= [Util colorWithHexString:@"#D9A657"];
    configure.indicatorHeight = 3;
    configure.spacingBetweenButtons =32;
    configure.indicatorFixedWidth = 40;
    configure.indicatorCornerRadius = 5;
    configure.bottomSeparatorColor = [UIColor clearColor];
    configure.indicatorColor = [Util colorWithHexString:@"#D9A657"];
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 10.f, kScreenWidth ,28.f) delegate:self titleNames:self.titleArray configure:configure];
    self.pageTitleView.backgroundColor=[UIColor whiteColor];
    self.pageTitleView.selectedIndex  = 0;
    [self addSubview:self.pageTitleView];
//    CGFloat offsetH = [Util isIPhoneXSeries] ? HEIGHT_NAVBAR_iPhoneX + HEIGHT_TABBAR_iPhoneX : HEIGHT_NAVBAR+HEIGHT_TABBAR+HEIGHT_STATUSBAR;
    CGFloat offsetH = [Util isIPhoneXSeries] ? HEIGHT_NAVBAR_iPhoneX : HEIGHT_NAVBAR+HEIGHT_STATUSBAR;
    CGFloat height = kScreenHeight - offsetH - 48.f ;

    self.pageContentScrollView = [[SGPageContentScrollView alloc] initWithFrame:CGRectMake(0, 48.f, kScreenWidth,height) parentVC:vc childVCs:[self viewArrayWithArray:titleArray]];
    self.pageContentScrollView.delegatePageContentScrollView = self;
    [self addSubview:self.pageContentScrollView];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}

- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentScrollView setPageContentScrollViewCurrentIndex:selectedIndex];
}

#pragma mark ---懒加载
- (NSArray *)viewArrayWithArray:(NSArray*)array{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i=0; i <array.count; i++) {
        NSString *title = [array objectAtIndex:i];
        HomeListViewController *controller = [[HomeListViewController alloc] initWithNibName:@"HomeListViewController" bundle:nil];
        controller.title = title ;
        [arr addObject:controller];
    }
    return arr;
}

@end
