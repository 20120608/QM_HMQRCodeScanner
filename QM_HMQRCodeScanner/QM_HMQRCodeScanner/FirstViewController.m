//
//  FirstViewController.m
//  QM_HMQRCodeScanner
//
//  Created by 漂读网 on 2018/12/21.
//  Copyright © 2018 漂读网. All rights reserved.
//

#import "FirstViewController.h"
#import "DQMDefaultTableViewCell.h"

#import "QRCodeTestViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  DQMDefaultTableViewCell *cell = [DQMDefaultTableViewCell cellWithTableView:tableView Title:@"生成/扫描二维码/条形码" TitleFont:[UIFont systemFontOfSize:16] TableViewCellStyle:UITableViewCellStyleDefault];
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  QRCodeTestViewController *vc = [[QRCodeTestViewController alloc] initWithTitle:@"二维码扫描"];
  [self.navigationController pushViewController:vc animated:true];
}


@end
