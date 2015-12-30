//
//  SHHJViewController.h
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/7/28.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AFNetworking.h"
#import "MyTableViewCell.h"

@interface SHHJViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UINavigationControllerDelegate>{
    UITableView *_tableView;
    UITableView *_tableView2;
    UILabel *_biaoti;

    NSString *_category;
    NSMutableArray *_dataArr;
    BOOL _isRefreshing;
    BOOL _isloadMore;
    AFHTTPRequestOperationManager *_manager;
    NSArray *_nameArr;
    //_py可以控制横向偏移量 
    int _py;
    UIButton *_next;
    UIScrollView *_myScrollView;
    


}
@property (nonatomic, strong)AFHTTPRequestOperationManager *manager;

@property (nonatomic,strong)  UITableView*tableView;
@property (nonatomic,strong)  UITableView*tableView2;
@property (nonatomic,strong)  UIScrollView *myScrollView;

@property(nonatomic)BOOL isRefreshing;
@property(nonatomic)BOOL isloadMore;
@property(nonatomic,assign)int py;
@property(nonatomic,strong)UILabel *biaoti;

@property (nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)NSArray *nameArr;
@property(nonatomic,strong)NSString *category;
@property (nonatomic,strong)  UIButton*next;
-(void)nextClick:(UIButton *)button;




@end
