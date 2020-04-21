//
//  SegmentViewController.h
//  PersonalCenter
//
//  Created by Arch on 2017/6/16.
//  Copyright © 2017年 mint_bin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGPagingView.h"
#import "CenterTouchTableView.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface SegmentParentViewController : UIViewController

@property (strong, nonatomic) CenterTouchTableView *myCollectionView ;
@property (assign, nonatomic) CGFloat tabyOffset ;

- (void)scrollParanetViewDidScroll:(UIScrollView *)scrollView ;
@end
