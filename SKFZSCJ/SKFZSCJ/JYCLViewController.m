//
//  JYCLViewController.m
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/7/27.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import "JYCLViewController.h"
#import "JYAndZXViewController.h"
#import "XINWENshichang.h"
#import "XINWENgongsi.h"
#import "XINWENyanghang.h"
#import "XINWENjingji.h"
#import "XINWENouzhou.h"
#import "XINWENchina.h"
#import "XINWENmeiguo.h"
#import "XINWENtuijian.h"
#import "XINWENzuire.h"
#import "XINWENquanqiu.h"
@interface JYCLViewController ()

@end

@implementation JYCLViewController

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

- (IBAction)jiaoyiceluede:(id)sender {
    JYAndZXViewController *hh=[[JYAndZXViewController alloc]init];
    //[self presentModalViewController:hh animated:YES];
    [self presentViewController:hh animated:YES completion:nil];
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)quanqiu:(id)sender {
    XINWENquanqiu *hh=[[XINWENquanqiu alloc]init];

    [self presentViewController:hh animated:YES completion:nil];
}

- (IBAction)zuire:(id)sender {
    XINWENzuire *hh=[[XINWENzuire alloc]init];
    [self presentViewController:hh animated:YES completion:nil];
}

- (IBAction)meiguo:(id)sender {
    XINWENmeiguo *hh=[[XINWENmeiguo alloc]init];
    [self presentViewController:hh animated:YES completion:nil];
}

- (IBAction)zhongguo:(id)sender {
    XINWENchina *hh=[[XINWENchina alloc]init];
    [self presentViewController:hh animated:YES completion:nil];
}

- (IBAction)ouzhou:(id)sender {
    XINWENouzhou *hh=[[XINWENouzhou alloc]init];
    [self presentViewController:hh animated:YES completion:nil];
}

- (IBAction)yanghang:(id)sender {
    XINWENyanghang *hh=[[XINWENyanghang alloc]init];
    [self presentViewController:hh animated:YES completion:nil];
}

- (IBAction)gongsi:(id)sender {
    XINWENgongsi *hh=[[XINWENgongsi alloc]init];
    [self presentViewController:hh animated:YES completion:nil];
}

- (IBAction)shichang:(id)sender {
    XINWENshichang *hh=[[XINWENshichang alloc]init];
    [self presentViewController:hh animated:YES completion:nil];
}

- (IBAction)tuijian:(id)sender {
    XINWENzuire *hh=[[XINWENzuire alloc]init];
    [self presentViewController:hh animated:YES completion:nil];
}

- (IBAction)jingji:(id)sender {
    XINWENjingji *hh=[[XINWENjingji alloc]init];
    [self presentViewController:hh animated:YES completion:nil];
}
@end
