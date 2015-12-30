//
//  NameCell.h
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/8/1.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoldModel.h"
@interface NameCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
- (void)showDataWithModel:(GoldModel *)model indexPath:(NSIndexPath *)indexpath;

@end
