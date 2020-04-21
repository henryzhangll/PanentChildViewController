//
//  DiscountListViewController.m
//  Project
//
//  Created by apple on 2019/9/18.
//  Copyright © 2019 clubcard. All rights reserved.
//

#import "HomeListViewController.h"
#import "HomeListCell.h"
#define KLIST_COLUNM 2
#define KLIST_SPACE 20.f
#define KLIST_WIDTH (kScreenWidth - KLIST_SPACE * (KLIST_COLUNM + 1))/KLIST_COLUNM


static NSString * ListCell = @"HomeListCell";
@interface HomeListViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, assign) BOOL canScroll;
@property (nonatomic, strong) NSNumber *selectedPageIndex;
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation HomeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array = [NSMutableArray arrayWithArray:@[@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1"]];
    [self.collectionView registerNib:[UINib nibWithNibName:ListCell bundle:nil] forCellWithReuseIdentifier:ListCell];
    
    // Do any additional setup after loading the view from its nib.
    self.collectionView.delegate = self ;
    self.scrollView = self.collectionView ;
}

#pragma -------------UICollectionDataSource-------------
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.array.count > 0) {
        HomeListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ListCell forIndexPath:indexPath];
        if (!cell) {
            cell=[collectionView dequeueReusableCellWithReuseIdentifier:ListCell forIndexPath:indexPath];
        }
        return cell;
    }
    
    return [UICollectionViewCell new];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.array.count ;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1 ;
}

#pragma -------------UICollectionDelegateFlowLayout-------------
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath

{
    if (self.array.count > 0) {
        return CGSizeMake(KLIST_WIDTH ,KLIST_WIDTH + 42.f + 5.0f + 25.f + 17.f + 5.f + 10.f);
    }
    return CGSizeZero;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (self.array.count > 0) {
        return UIEdgeInsetsMake(KLIST_SPACE/2, KLIST_SPACE, KLIST_SPACE/2, KLIST_SPACE);
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return KLIST_SPACE;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.f;
}

#pragma -------------UICollectionDelegate-------------
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
