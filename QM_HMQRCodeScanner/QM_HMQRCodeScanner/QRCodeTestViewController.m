//
//  QRCodeTestViewController.m
//  QM_HMQRCodeScanner
//
//  Created by 漂读网 on 2018/12/21.
//  Copyright © 2018 漂读网. All rights reserved.
//

#import "QRCodeTestViewController.h"
#import "HMScannerController.h"

@interface QRCodeTestViewController ()

@property (weak, nonatomic) UIImageView *myImageView;

@end

@implementation QRCodeTestViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
  
  UIImageView *imageV = [[UIImageView alloc] init];
  imageV.size = CGSizeMake(150, 150);
  imageV.centerX = 100;
  imageV.centerY = 100;
  [self.tableView.tableHeaderView addSubview:imageV];
  _myImageView = imageV;
  
  QMWeak(self);
  //第一行
  self.addItem([StaticListItem itemWithTitle:@"文字:" subTitle:@"https://github.com/20120608/QM_HMQRCodeScanner" fixedCellHeight:AdaptedWidth(60) itemOperation:nil]);
  //生成二维码
  [HMScannerController cardImageWithCardName:@"https://github.com/20120608/QM_HMQRCodeScanner" avatar:nil scale:0.2 completion:^(UIImage *image) {
    weakself.myImageView.image = image;
  }];
  
  //第二行
  self.addItem([StaticListItem itemWithTitle:@"根据文字生成二维码" subTitle:@"" itemOperation:^(NSIndexPath *indexPath) {
    
    [UIAlertController qm_showAlertWithTitle:@"请输入文字" message: nil appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
      
      [alertMaker addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入文字";
      }];
      
      alertMaker.addActionDefaultTitle(@"确认");
      
    } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
      
      if (alertSelf.textFields.firstObject.text.length) {
        
        weakself.sections.firstObject.items.firstObject.subTitle = alertSelf.textFields.firstObject.text;
        [HMScannerController cardImageWithCardName:alertSelf.textFields.firstObject.text avatar:nil scale:0.2 completion:^(UIImage *image) {
          weakself.myImageView.image = image;
        }];
        //弄图片
        [weakself.tableView reloadRow:0 inSection:0 withRowAnimation:0];
      }
      
    }];
    
    //可以用点语法继续使用
  }]).addItem([StaticListItem itemWithTitle:@"二维码扫描" subTitle:@"" accessoryType:UITableViewCellAccessoryDisclosureIndicator itemOperation:^(NSIndexPath *indexPath) {
    
    HMScannerController *scanner = [HMScannerController scannerWithCardName:@"https://www.github.com/njhu" avatar:nil completion:^(NSString *stringValue) {
      
      weakself.sections.firstObject.items.firstObject.subTitle = stringValue;
      
      [weakself.tableView reloadRow:0 inSection:0 withRowAnimation:0];
      
      [HMScannerController cardImageWithCardName:stringValue avatar:nil scale:0.2 completion:^(UIImage *image) {
        weakself.myImageView.image = image;
      }];
    }];
    
    [scanner setTitleColor:[UIColor whiteColor] tintColor:[UIColor greenColor]];
    
    [weakself showDetailViewController:scanner sender:nil];
    
  }]);
  
}




/** 导航条左边的按钮 */
- (UIImage *)dqmNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(DQMNavigationBar *)navigationBar
{
  [leftButton setImage:[UIImage imageNamed:@"NavgationBar_white_back"] forState:UIControlStateHighlighted];
  
  return [UIImage imageNamed:@"NavgationBar_blue_back"];
}

#pragma mark - DQMNavUIBaseViewControllerDelegate
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(DQMNavigationBar *)navigationBar
{
  [self.navigationController popViewControllerAnimated:YES];
}



@end

