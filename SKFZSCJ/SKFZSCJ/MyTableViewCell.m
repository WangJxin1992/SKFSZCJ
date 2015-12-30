//
//  MyTableViewCell.m
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/7/29.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)showDataWithModel:(GoldModel *)model indexPath:(NSIndexPath *)indexpath{
    self.Last.text=model.Last;
    //self.Last.textColor=[UIColor orangeColor];
       self.Low.text=model.Low;
    self.Open.text=model.Open;
    self.High.text=model.High;

    self.LastClose.text=model.LastClose;
    float chengjiaoe=[model.TurnOver floatValue]/10000;
    float A=[model.Last floatValue];
    float B=[model.LastClose floatValue];
    float D=[model.Open floatValue];
    float high=[model.High floatValue];
    float low=[model.Low floatValue];



   //控制最新的颜色变化
    if (A>B) {
        self.Last.textColor=[UIColor redColor];
}    else
    if (A==0) {
        self.Last.textColor=[UIColor whiteColor];
}
    else{
        self.Last.textColor=[UIColor greenColor];
    }
      //控制开盘的颜色变化
    if (D>B) {
        self.Open.textColor=[UIColor redColor];
    }
    else
        if (D==0) {
            self.Open.textColor=[UIColor whiteColor];
        }
    else{
        self.Open.textColor=[UIColor greenColor];
    }
    //控制最高的颜色变化
    if (high>B) {
        self.High.textColor=[UIColor redColor];
    }
    else
        if (high==0) {
            self.High.textColor=[UIColor whiteColor];
        }
    else{
        self.High.textColor=[UIColor greenColor];
    }
     //控制最低的颜色变化
    if (low>B) {
        self.Low.textColor=[UIColor redColor];
    }
    else
        if (low==0) {
            self.Low.textColor=[UIColor whiteColor];
        }
    else{
        self.Low.textColor=[UIColor greenColor];
    }
  //控制涨跌 的颜色变化

    float C =A-B;
    if (C>0) {
        self.Buy.textColor=[UIColor redColor];
    }
    else if(C==0){
        self.Buy.textColor=[UIColor whiteColor];


    }
    else{
        self.Buy.textColor=[UIColor greenColor];

}
    //控制涨幅 的颜色变化

    float zhangfu=C/(B*0.01);
    if (C>0) {
        self.zhangfu.textColor=[UIColor redColor];
    }
    else if(C==0){
        self.zhangfu.textColor=[UIColor whiteColor];


    }
    else{
        self.zhangfu.textColor=[UIColor greenColor];
        
    }
    NSString *ch=[NSString stringWithFormat:@"%.2f",C];
    NSString *ch1=[NSString stringWithFormat:@"%.2f%%",zhangfu];
    NSString *chengjiaoe2=[NSString stringWithFormat:@"%.2f万",chengjiaoe];

    self.Buy.text=ch;
    self.Volume.text=model.Volume;
    self.LastSettle.text=model.LastSettle;

    self.Average.text=model.Average;
    self.TurnOver.text=chengjiaoe2;
    self.zhangfu.text=ch1;


    /*"Last": "218.80", 最新
     "Open": "216.70",开盘
     "High": "220.20",最高
     "Low": "216.65",最低
     "LastClose": "216.85",昨收
     "Buy": "218.35",  涨跌 等于 最新减去昨收*/



}
/*
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
 */
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
