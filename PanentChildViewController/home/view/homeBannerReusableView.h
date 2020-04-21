//
//  homeReusableView.h
//  Project
//
//  Created by henryzhang on 2019/9/18.
//  Copyright © 2019 clubcard. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

NS_ASSUME_NONNULL_BEGIN

@interface homeBannerReusableView : UICollectionReusableView<UIScrollViewDelegate>

/**
 *  图片数组
 */
@property (nonatomic, copy) NSArray *bannerArray;

+ (CGFloat) returnCellHeifht ;

@end

NS_ASSUME_NONNULL_END
