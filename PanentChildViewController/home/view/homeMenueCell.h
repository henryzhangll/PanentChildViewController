//
//  homeMenueCell.h
//  Project
//
//  Created by henryzhang on 2019/9/18.
//  Copyright © 2019 clubcard. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


#define KMENUE_COLUNM 4
#define KMENUE_SPACE 13.f
#define KMENUE_WIDTH (kScreenWidth - KMENUE_SPACE * (KMENUE_COLUNM + 1))/KMENUE_COLUNM

@interface homeMenueCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *desLbl;

@end
