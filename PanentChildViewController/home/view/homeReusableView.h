//
//  homeReusableView.h
//  Project
//
//  Created by henryzhang on 2019/9/18.
//  Copyright © 2019 clubcard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGPagingView.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


NS_ASSUME_NONNULL_BEGIN

@interface homeReusableView : UICollectionReusableView<SGPageTitleViewDelegate, SGPageContentScrollViewDelegate>

@property (nonatomic,strong) SGPageTitleView * pageTitleView;
@property (nonatomic,strong) SGPageContentScrollView *pageContentScrollView;
@property (nonatomic,strong) NSMutableArray *titleArray;
- (void)setupTitleView:(UIViewController *)vc titleArray:(NSArray *)titleArray;

@end

NS_ASSUME_NONNULL_END
