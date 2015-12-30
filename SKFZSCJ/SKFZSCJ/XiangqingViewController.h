//
//  XiangqingViewController.h
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/8/6.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UMSocial.h"
#import "ZXDModel.h"

@interface XiangqingViewController : UIViewController<UIWebViewDelegate,UMSocialUIDelegate>
{
    UIWebView *_webView;
    NSURLRequest *_request;
    NSString *_urll;
    ZXDModel *_modell;
    
    
}
@property (nonatomic,strong)  NSURLRequest *request;
@property (nonatomic,strong)  NSString*urll;
@property (nonatomic,strong)  ZXDModel*modell;


@end
