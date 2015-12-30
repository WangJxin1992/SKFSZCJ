//
//  JYAndZXViewController.h
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/8/4.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "JHRefresh.h"
#import "ZXDModel.h"
#import "UMSocial.h"

@interface JYAndZXViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UMSocialUIDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArr;
    NSInteger _currentPage;
    BOOL _isRefreshing;
    BOOL _isLoadMore;
    UILabel *_biaoti;
    NSString *_category;
    AFHTTPRequestOperationManager *_manager;
}
@property (nonatomic,strong)  ZXDModel *zxdmodel;
@property (nonatomic,strong)  NSString *category;
@property(nonatomic) NSInteger currentPage;
@property (nonatomic,strong)    UITableView *tableView;
@property (nonatomic,strong)  NSMutableArray *dataArr;
@property(nonatomic)BOOL isRefreshing;
@property(nonatomic)BOOL isLoadMore;
@property (nonatomic,strong) UILabel *biaoti;
@property (nonatomic,strong) AFHTTPRequestOperationManager *manager;

@end
