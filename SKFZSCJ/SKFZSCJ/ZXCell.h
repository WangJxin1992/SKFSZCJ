//
//  ZXCell.h
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/8/4.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXDModel.h"
#import "UMSocial.h"

@interface ZXCell : UITableViewCell<UMSocialUIDelegate>

@property (nonatomic,strong)  NSMutableDictionary *dit;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;

@property (weak, nonatomic) IBOutlet UILabel *time;
- (void)showDataWithModel:(ZXDModel *)model indexPath:(NSIndexPath *)indexpath;
@end
