//
//  XINWENshichang.m
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/8/5.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import "XINWENshichang.h"

@interface XINWENshichang ()

@end

@implementation XINWENshichang

- (void)viewDidLoad {
    _category=kshichang;

    NSLog(@"市场%@",_category);
    [super viewDidLoad];
      _biaoti.text=@"市场";
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
