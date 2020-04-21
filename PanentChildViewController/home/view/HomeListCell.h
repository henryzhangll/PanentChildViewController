//
//  NewHotListCell.h
//  Project
//
//  Created by 潘洪波 on 2019/7/29.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


NS_ASSUME_NONNULL_BEGIN

@interface HomeListCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIButton *youhuiquanBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *priceLbl;
@property (weak, nonatomic) IBOutlet UIButton *zhuanxiangjiaBtn;
@property (weak, nonatomic) IBOutlet UILabel *cankaojiaLbl;
@property (weak, nonatomic) IBOutlet UILabel *oldPriceLbl;
@property (weak, nonatomic) IBOutlet UILabel *oldPriceLine;

@end

NS_ASSUME_NONNULL_END
