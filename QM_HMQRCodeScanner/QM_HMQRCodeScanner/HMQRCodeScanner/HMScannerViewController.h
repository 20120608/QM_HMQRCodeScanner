//
//  HMScannerViewController.h
//  HMQRCodeScanner
//
//  Created by 刘凡 on 16/1/2.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 扫描控制器
@interface HMScannerViewController : UIViewController

/** 名片按钮是否隐藏 */
@property(nonatomic,assign, getter=ishideCardButton) BOOL          hideCardButton;

/** 手电按钮是否隐藏 */
@property(nonatomic,assign, getter=ishidecardButton) BOOL          hideLightButton;


/// 实例化扫描控制器
///
/// @param cardName   名片字符串
/// @param avatar     头像图片
/// @param completion 完成回调
///
/// @return 扫描控制器
- (instancetype)initWithCardName:(NSString *)cardName avatar:(UIImage *)avatar hideCardButton:(BOOL)hideCardButton hideLightButton:(BOOL)hideLightButton completion:(void (^)(NSString *stringValue))completion;

@end
