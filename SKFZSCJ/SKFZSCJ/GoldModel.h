//
//  GoldModel.h
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/7/27.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import "LZXModel.h"

@interface GoldModel : LZXModel

@property (nonatomic, copy) NSString *Code;

@property (nonatomic, copy) NSString *Open;

@property (nonatomic, copy) NSString *Last;

@property (nonatomic, copy) NSString *Draw;

@property (nonatomic, copy) NSString *Low;

@property (nonatomic, copy) NSString *High;

@property (nonatomic, copy) NSString *Name;

@property (nonatomic, copy) NSString *UpDown;

@property (nonatomic, copy) NSString *Decimal;

@property (nonatomic, copy) NSString *UpDownRate;

@property (nonatomic, copy) NSString *Middle;

@property (nonatomic, copy) NSString *Buy;

@property (nonatomic, copy) NSString *QuoteTime;

@property (nonatomic, copy) NSString *Average;

@property (nonatomic, copy) NSString *LastSettle;

@property (nonatomic, copy) NSString *Sell;

@property (nonatomic, copy) NSString *LastClose;

@property (nonatomic, copy) NSString *End;

@property (nonatomic, copy) NSString *Start;

@property (nonatomic, copy) NSString *Volume;

@property (nonatomic, copy) NSString *TurnOver;

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
