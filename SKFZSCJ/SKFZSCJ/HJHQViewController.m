//
//  HJHQViewController.m
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/7/27.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import "HJHQViewController.h"
#import "SHHJViewController.h"
#import "YueguiyinViewController.h"
#import "TianjiaosuoViewController.h"
#import "ShanghaihuangjinViewController.h"
#import "GuojihuangjinViewController.h"


@interface HJHQViewController ()

@end

@implementation HJHQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.title = @"1234";
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

- (IBAction)SHHJ:(id)sender {
    ShanghaihuangjinViewController *hh=[[ShanghaihuangjinViewController alloc]init];

    [self presentViewController:hh animated:YES completion:nil];

}

- (IBAction)GJHJ:(UIButton *)sender {
    GuojihuangjinViewController *hh=[[GuojihuangjinViewController alloc]init];
    [self presentViewController:hh animated:YES completion:nil];
}

- (IBAction)YJY:(UIButton *)sender {
    YueguiyinViewController *hh=[[YueguiyinViewController alloc]init];
    [self presentViewController:hh animated:YES completion:nil];

}

- (IBAction)TJS:(UIButton *)sender {
    TianjiaosuoViewController *hh=[[TianjiaosuoViewController alloc]init];
[self presentViewController:hh animated:YES completion:nil];
}

- (IBAction)BackClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
