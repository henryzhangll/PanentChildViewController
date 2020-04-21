//
//  Util.h
//  PanentChildViewController
//
//  Created by apple on 2020/4/21.
//  Copyright © 2020 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define     HEIGHT_STATUSBAR    20 // 状态栏
#define     HEIGHT_TABBAR       49 // 标签
#define     HEIGHT_TABBAR_CHAT  81 // 聊天状态栏
#define     HEIGHT_TABBAR_CHAT_iPhoneX     115 // 聊天状态栏
#define     HEIGHT_TABBAR_iPhoneX  83 //
#define     HEIGHT_NAVBAR_iPhoneX  88
#define     HEIGHT_BOTTOM_SAFEAREA_iPhoneX  34 // x系列底部安全域
#define     HEIGHT_NAVBAR       44 // 导航
#define     HEIGHT_CHATBOXVIEW  215// 更多 view

NS_ASSUME_NONNULL_BEGIN

@interface Util : NSObject
+ (UIColor *)colorWithHexString: (NSString *)color alpha:(CGFloat)alpha ;

/**十六进制*/
+ (UIColor *)colorWithHexString: (NSString *)color;

// 判断 iPhoneX or later 设备 iPhoneX、iPhone XR、iPhone Xs、iPhone Xs Max 底部有安全距离所以可以使用 safeAreaInsets.bottom > 0.0
+ (BOOL) isIPhoneXSeries;
@end

NS_ASSUME_NONNULL_END
