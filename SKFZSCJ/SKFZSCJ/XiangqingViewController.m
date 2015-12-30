//
//  XiangqingViewController.m
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/8/6.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import "XiangqingViewController.h"
#import "UMSocial.h"

@interface XiangqingViewController ()

@end

@implementation XiangqingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webView=[[UIWebView alloc]init];
    _webView.delegate=self;
    self.view.backgroundColor=[UIColor blueColor];
    _webView.frame=CGRectMake(0, 4, self.view.frame.size.width, self.view.frame.size.height+6);

    _webView.autoresizingMask=UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
    _webView.scalesPageToFit=YES;
    //设置webview不能向下滚动
    [[[_webView subviews]objectAtIndex:0] setBounces:NO];
    

    [self.view addSubview:_webView];
    UIImageView *Daoimage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    UIButton *share=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *like=[UIButton buttonWithType:UIButtonTypeCustom];
    like.frame=CGRectMake(275, 25, 40, 35);
    [like addTarget:self action:@selector(likeClick:) forControlEvents:UIControlEventTouchUpInside];


        //[like setTitle:@"收藏" forState:UIControlStateNormal];
        like.titleLabel.font=[UIFont systemFontOfSize:17];
     [like setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

//    [share setImage:[UIImage imageNamed:@"browsetrip_share"] forState:UIControlStateNormal];
//    [share setImage:[UIImage imageNamed: @"browsetrip_share_press"] forState:UIControlStateHighlighted];
    share.frame=CGRectMake(self.view.frame.size.width-60, 25, 40, 35) ;
    [share setTitle:@"分享" forState:UIControlStateNormal];
    share.titleLabel.font=[UIFont systemFontOfSize:17];
    [share setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [share addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];


    [Daoimage setImage:[UIImage imageNamed: @"navigationbar"]];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];

    [button addTarget:self action:@selector(backbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.frame=CGRectMake(15, 25, 40, 34);
    button.titleLabel.font=[UIFont systemFontOfSize:17];
    [Daoimage addSubview:like];

    [Daoimage addSubview:share];

    [Daoimage addSubview:button];
    Daoimage.userInteractionEnabled=YES;
    [self.view addSubview:Daoimage];
    NSLog(@"%@",_webView);
    // Do any additional setup after loading the view.
}
-(void)likeClick:(UIButton*)button{


}
-(void)backbuttonClick:(UIButton *)button{
     [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)shareClick:(UIButton *)button{

    NSString *str=_urll;
    [UMSocialSnsService presentSnsIconSheetView:self appKey:@"507fcab25270157b37000010" shareText:str shareImage:[UIImage imageNamed: @"10174123"] shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToQzone,UMShareToSms,UMShareToEmail,UMShareToWechatTimeline,nil]  delegate:self ];


}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    if (navigationType==UIWebViewNavigationTypeLinkClicked) {
        return NO;
    }
    else{
        return YES;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
    
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
//    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com/index.php?tn=monline_3_dg"]];

    [_webView loadRequest:_request];

}


@end
