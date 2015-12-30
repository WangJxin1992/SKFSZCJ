//
//  TianjiaosuoViewController.m
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/8/2.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import "TianjiaosuoViewController.h"

@interface TianjiaosuoViewController ()

@end

@implementation TianjiaosuoViewController

- (void)viewDidLoad {
    _py=7;
    _category=kttj;
    [super viewDidLoad];
    _biaoti.text=@"天交所";

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
