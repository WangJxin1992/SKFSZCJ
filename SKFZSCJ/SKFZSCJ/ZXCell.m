//
//  ZXCell.m
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/8/4.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import "ZXCell.h"
#import "ZXDModel.h"
#import "UIImageView+WebCache.h"
#import "UMSocial.h"


@implementation ZXCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)showDataWithModel:(ZXDModel *)model indexPath:(NSIndexPath *)indexpath{
    self.title.text=model.title;
    //做好后要修改这个延迟图片
    [self.ImageView sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed: @"456.jpg"]];
    self.time.text=[LZXHelper dateStringFromNumberTimer:model.createdAt];
    [_dit setObject:model.url forKey:@"1"];
    NSLog(@"model.url%@",model.url);




}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
