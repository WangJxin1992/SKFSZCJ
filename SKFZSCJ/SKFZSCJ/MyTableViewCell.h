//
//  MyTableViewCell.h
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/7/29.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoldModel.h"

@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *Open;
@property (weak, nonatomic) IBOutlet UILabel *Last;
@property (weak, nonatomic) IBOutlet UILabel *High;
@property (weak, nonatomic) IBOutlet UILabel *Low;
@property (weak, nonatomic) IBOutlet UILabel *LastClose;
@property (weak, nonatomic) IBOutlet UILabel *Buy;
@property (weak, nonatomic) IBOutlet UILabel *Volume;
@property (weak, nonatomic) IBOutlet UILabel *LastSettle;
@property (weak, nonatomic) IBOutlet UILabel *Average;
@property (weak, nonatomic) IBOutlet UILabel *TurnOver;
@property (weak, nonatomic) IBOutlet UILabel *zhangfu;
- (void)showDataWithModel:(GoldModel *)model indexPath:(NSIndexPath *)indexpath;




/*{
 "Code": "MAUT+D",
 "Name": "MAUT+D",名称
 "QuoteTime": "1438367395",
 "Last": "218.80", 最新
 "Open": "216.70",开盘
 "High": "220.20",最高
 "Low": "216.65",最低
 "LastClose": "216.85",昨收
 "Buy": "218.35",  涨跌 等于 最新减去昨收
 "Sell": "218.80",
 "Decimal": "2",
 "Start": "21:00",
 "Middle": "02:30/09:00",
 "End": "15:30",
 "Draw": "600",
 "UpDown": "1.27",
 "UpDownRate": "0.58",
 "Volume": "18134",成交量
 "LastSettle": "217.53",昨结算
 "Average": "0.00",均价
 "TurnOver": "396469408.00"成交额
 }*/

@end
