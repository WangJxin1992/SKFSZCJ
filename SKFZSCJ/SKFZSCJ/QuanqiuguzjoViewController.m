//
//  QuanqiuguzjoViewController.m
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/8/2.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import "QuanqiuguzjoViewController.h"
#import "HJHQViewController.h"

@interface QuanqiuguzjoViewController ()

@end

@implementation QuanqiuguzjoViewController

- (void)viewDidLoad {
    _py=7;
    _category=kstockindex;
    [super viewDidLoad];
    _biaoti.text=@"全球股指";
    [_next setTitle:@"黄金行情" forState:UIControlStateNormal];


    // Do any additional setup after loading the view.
}
-(void)nextClick:(UIButton *)button{

    HJHQViewController *hh=[[HJHQViewController alloc]init];

    [self presentViewController:hh animated:YES completion:nil];
    
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
