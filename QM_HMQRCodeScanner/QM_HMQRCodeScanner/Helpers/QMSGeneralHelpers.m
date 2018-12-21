//
//  QMSGeneralHelpers.m
//  QM_EnlargementHeaderTableView
//
//  Created by 漂读网 on 2018/12/20.
//  Copyright © 2018 漂读网. All rights reserved.
//

#import "QMSGeneralHelpers.h"

@implementation QMSGeneralHelpers



/**
 由NSString 转成带颜色字体大小的 NSMutableAttributedString

 @param curTitle 文字
 @param font 字体大小
 @param rangeOfFont 字体大小范围
 @param color 文字颜色
 @param colorOfFont 文字颜色范围
 @return 带颜色字体大小的富文本 NSMutableAttributedString
 */
+ (NSMutableAttributedString *)changeStringToMutableAttributedStringTitle:(NSString *)curTitle font:(UIFont *)font rangeOfFont:(NSRange)rangeOfFont color:(UIColor *)color colorOfFont:(NSRange)colorOfFont
{
  NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:curTitle ?: @""];
  [title addAttribute:NSForegroundColorAttributeName value:color range:colorOfFont];
  [title addAttribute:NSFontAttributeName value:font range:rangeOfFont];
  return title;
}
@end
