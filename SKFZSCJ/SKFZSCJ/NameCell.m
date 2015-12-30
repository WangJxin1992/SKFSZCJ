//
//  NameCell.m
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/8/1.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import "NameCell.h"

@implementation NameCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)showDataWithModel:(GoldModel *)model indexPath:(NSIndexPath *)indexpath{
    self.nameLabel.text=model.Name;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
