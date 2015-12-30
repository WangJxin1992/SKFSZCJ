//
//  RootViewController.m
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/7/27.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import "RootViewController.h"
#import "HJHQViewController.h"
#import "QQSCViewController.h"
#import "JYCLViewController.h"
#import "ShezhiViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // [_ss addTarget:self action:@selector(zhu:) forControlEvents:UIControlEventTouchUpInside];
  
    
    
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

- (IBAction)HJHQ:(UIButton*)sender{
    HJHQViewController *hh=[[HJHQViewController alloc]init];

     [self presentViewController:hh animated:YES completion:nil];
    //[self.navigationController pushViewController:hh animated:YES];
}

- (IBAction)QQHQ:(UIButton *)sender {
   QQSCViewController *hh=[[QQSCViewController alloc]init];
     [self presentViewController:hh animated:YES completion:nil];

}



- (IBAction)JYCL:(id)sender {
    JYCLViewController *hh=[[JYCLViewController alloc]init];
   [self presentViewController:hh animated:YES completion:nil];
}

- (IBAction)JPFX:(UIButton *)sender {
}

- (IBAction)ShezhiClick:(UIButton *)sender {
    ShezhiViewController *hh=[[ShezhiViewController alloc]init];
    [self presentViewController:hh animated:YES completion:nil];
}
@end
