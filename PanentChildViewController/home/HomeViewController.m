//
//  ActivateViewController.m
//  Project
//
//  Created by apple on 2019/9/17.
//  Copyright © 2019 张立丹. All rights reserved.
//

#import "HomeViewController.h"
#import "homeBannerReusableView.h"
#import "homeMenueCell.h"
#import "homeReusableView.h"
#import "Util.h"
static NSString *bannerView = @"homeBannerReusableView";
static NSString *listRoomCell = @"NewHotListCell";
static NSString *menueCell = @"homeMenueCell";
static NSString *reusableView = @"homeReusableView";
@interface HomeViewController ()<UISearchBarDelegate,UIGestureRecognizerDelegate>

@property(nonatomic, assign) BOOL isRefreshing;
@end

@implementation HomeViewController

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self haya_initNavigationView];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.sectionHeadersPinToVisibleBounds = YES;
//    CGFloat offsetH = [Util isIPhoneXSeries] ? HEIGHT_NAVBAR_iPhoneX + HEIGHT_TABBAR_iPhoneX : HEIGHT_NAVBAR+HEIGHT_TABBAR+HEIGHT_STATUSBAR;
    CGFloat offsetH = [Util isIPhoneXSeries] ? HEIGHT_NAVBAR_iPhoneX : HEIGHT_NAVBAR+HEIGHT_STATUSBAR;
    self.myCollectionView = [[CenterTouchTableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-offsetH) collectionViewLayout:layout];
    self.myCollectionView.backgroundColor = [UIColor whiteColor] ;
    self.myCollectionView.delegate = self;
    self.myCollectionView.dataSource = self;
    self.myCollectionView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.myCollectionView];
    
    [self.myCollectionView registerNib:[UINib nibWithNibName:menueCell bundle:nil] forCellWithReuseIdentifier:menueCell];
//    [self.myCollectionView registerNib:[UINib nibWithNibName:bannerCell bundle:nil] forCellWithReuseIdentifier:bannerCell];
    [self.myCollectionView registerNib:[UINib nibWithNibName:listRoomCell bundle:nil] forCellWithReuseIdentifier:listRoomCell];
    [self.myCollectionView registerNib:[UINib nibWithNibName:bannerView bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:bannerView];
    
    [self.myCollectionView registerNib:[UINib nibWithNibName:reusableView bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reusableView];

    //临界点偏移量(吸顶临界点)
    self.tabyOffset = 350.f;
    
    [self.myCollectionView reloadData];
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.myCollectionView.frame = CGRectMake(0, 0, kScreenWidth, self.view.bounds.size.height) ;
}

#pragma mark --- private
//定制 导航栏  搜索功能
- (void)haya_initNavigationView
{
    self.navigationItem.title = @"子父控制器嵌套滑动demo";
}

/// 消息跳转
- (void)messageClick {
   
}

#pragma -------------UICollectionDataSource-------------
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            homeMenueCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:menueCell forIndexPath:indexPath];
            if (!cell) {
                cell=[collectionView dequeueReusableCellWithReuseIdentifier:menueCell forIndexPath:indexPath];
            }
            
            cell.imgView.backgroundColor = [UIColor yellowColor];
            cell.titleLbl.text = @"demo" ;
            cell.desLbl.text = @"demo" ;
            return cell;
        }
            break;
        default:
            break;
    }
    return [UICollectionViewCell new];
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath*)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        switch (indexPath.section) {
            case 0:
            {
                homeBannerReusableView * headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:bannerView forIndexPath:indexPath];
                if (!headView) {
                    headView =[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:bannerView forIndexPath:indexPath];
                }
                [headView setBannerArray:@[@"1",@"2",@"3"]];
                return headView;
            }
                break;
            case 1:
                break;
            case 2:
            {
                homeReusableView * headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"homeReusableView" forIndexPath:indexPath];
                if (!headView) {
                    headView =[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"homeReusableView" forIndexPath:indexPath];
                }
                [headView setupTitleView:self titleArray:@[@"1",@"2",@"3"]];
                return headView;
            }
                break;
            default:
                break;
        }
    }
    return [UICollectionReusableView new];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            return 0;
        }
            break;
        case 1:
        {
            return 20 ;
        }
            break;
        default:
            return 0;
            break;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3 ;
}

#pragma -------------UICollectionDelegateFlowLayout-------------
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            CGFloat h = [homeBannerReusableView returnCellHeifht];
            return CGSizeMake(kScreenWidth ,h);
        }
            break;
        case 1:
            break;
        case 2:
        {
//            CGFloat offsetH = [Util isIPhoneXSeries] ? HEIGHT_NAVBAR_iPhoneX + HEIGHT_TABBAR_iPhoneX : HEIGHT_NAVBAR+HEIGHT_TABBAR+HEIGHT_STATUSBAR;
            CGFloat offsetH = [Util isIPhoneXSeries] ? HEIGHT_NAVBAR_iPhoneX : HEIGHT_NAVBAR+HEIGHT_STATUSBAR;
            CGFloat height = kScreenHeight - offsetH ;
            return CGSizeMake(kScreenWidth ,height);
        }
            break;
        default:
            break;
    }
    return CGSizeZero;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath

{
    switch (indexPath.section) {
        case 0:
        {
           return CGSizeZero;
        }
            break;
        case 1:
        {
            return CGSizeMake(KMENUE_WIDTH ,KMENUE_WIDTH + 18.f + 15.f - 15.f*2);
        }
            break;
        default:
            return CGSizeZero;
            break;
    }
    
    return CGSizeZero;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            return UIEdgeInsetsMake(KMENUE_SPACE/2, KMENUE_SPACE, KMENUE_SPACE/2, KMENUE_SPACE);
        }
            break;
        default:
            return UIEdgeInsetsMake(0, 0, 0, 0);
            break;
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return KMENUE_SPACE/2 ;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return KMENUE_SPACE/2 ;
}

#pragma -------------UICollectionDelegate-------------
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
           
        }
            break;
        default:
            break;
    }
}

- (void)scrollParanetViewDidScroll:(UIScrollView *)scrollView {
    NSIndexPath *path = [NSIndexPath indexPathForItem:0 inSection:2];
    /// 如果是header 用如下方法
    NSArray *array = [self.myCollectionView visibleSupplementaryViewsOfKind:UICollectionElementKindSectionHeader];
    if (array.count > 0) {
        for (UICollectionReusableView *view in array) {
            if ([view isMemberOfClass:[homeReusableView class]]) {
                UICollectionViewLayoutAttributes *attributes = [self.myCollectionView layoutAttributesForSupplementaryElementOfKind:UICollectionElementKindSectionHeader atIndexPath:path];
                CGFloat offsetH = [Util isIPhoneXSeries] ? HEIGHT_NAVBAR_iPhoneX : HEIGHT_NAVBAR+HEIGHT_STATUSBAR;
                self.tabyOffset = attributes.frame.origin.y - offsetH;
            }
        }
    }

//    /// 如果是cell 用如下方法
//    UICollectionViewCell *cell = [self.myCollectionView cellForItemAtIndexPath:path];
//    if (cell) {
//        CGRect rect = [self.myCollectionView convertRect:cell.frame toView:self.myCollectionView];
//        self.tabyOffset = rect.origin.y + rect.size.height;
//    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
