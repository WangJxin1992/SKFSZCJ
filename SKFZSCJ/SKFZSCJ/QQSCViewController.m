//
//  QQSCViewController.m
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/7/27.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import "QQSCViewController.h"
#import "ShanghaiqihuoViewController.h"
#import "COMEqijinViewController.h"
#import "IPEyuanyouViewController.h"
#import "NYMEyuanyouViewController.h"
#import "QuanqiuguzjoViewController.h"
#import "WaihuiViewController.h"

@interface QQSCViewController ()

@end

@implementation QQSCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)Waihui:(UIButton *)sender {
    WaihuiViewController *hh=[[WaihuiViewController alloc]init];
    [self presentViewController:hh animated:YES completion:nil];

}

- (IBAction)NYMEClick:(UIButton *)sender {
    NYMEyuanyouViewController *hh=[[NYMEyuanyouViewController alloc]init];
    [self presentViewController:hh animated:YES completion:nil];

}

- (IBAction)COMEXClick:(UIButton *)sender {
    COMEqijinViewController *hh=[[COMEqijinViewController alloc]init];
    [self presentViewController:hh animated:YES completion:nil];

}

- (IBAction)QQGZClick:(UIButton *)sender {
    QuanqiuguzjoViewController *hh=[[QuanqiuguzjoViewController alloc]init];
    [self presentViewController:hh animated:YES completion:nil];

}

- (IBAction)IPEClick:(UIButton *)sender {
    IPEyuanyouViewController *hh=[[IPEyuanyouViewController alloc]init];
    [self presentViewController:hh animated:YES completion:nil];

}

- (IBAction)SHQHClick:(UIButton *)sender {
    ShanghaiqihuoViewController *hh=[[ShanghaiqihuoViewController alloc]init];
    [self presentViewController:hh animated:YES completion:nil];

}

- (IBAction)BackClick:(UIButton *)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
}
@end
