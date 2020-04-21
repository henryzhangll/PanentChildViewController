//
//  CenterTouchTableView.m
//  PersonalCenter
//
//  Created by Arch on 2017/6/16.
//  Copyright © 2017年 mint_bin. All rights reserved.
//
#import "CenterTouchTableView.h"
#import "Util.h"
@implementation CenterTouchTableView
//是否让外层tableView的手势透传到子视图
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    CGFloat offsetH = [Util isIPhoneXSeries] ? HEIGHT_NAVBAR_iPhoneX + HEIGHT_TABBAR_iPhoneX : HEIGHT_NAVBAR+HEIGHT_TABBAR+HEIGHT_STATUSBAR;
    CGFloat offsetH = [Util isIPhoneXSeries] ? HEIGHT_NAVBAR_iPhoneX : HEIGHT_NAVBAR+HEIGHT_STATUSBAR;
    CGFloat segmentViewContentScrollViewHeight = kScreenHeight - offsetH ;
    CGPoint currentPoint = [gestureRecognizer locationInView:self];
    if (CGRectContainsPoint(CGRectMake(0, self.contentSize.height - segmentViewContentScrollViewHeight, kScreenWidth, segmentViewContentScrollViewHeight), currentPoint) ) {
        return YES;
    }
    return NO;
}

@end
