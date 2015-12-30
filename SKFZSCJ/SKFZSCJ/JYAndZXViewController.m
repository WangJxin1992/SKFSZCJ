//
//  JYAndZXViewController.m
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/8/4.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import "JYAndZXViewController.h"
#import "ZXCell.h"
#import "ZXDModel.h"
//xml第三方库
#import "GDataXMLNode.h"
#import "XiangqingViewController.h"
#import "RootViewController.h"
#import "HJHQViewController.h"
#import "QQSCViewController.h"
#import "LZXHelper.h"
#import "UMSocial.h"

@interface JYAndZXViewController ()

@end

@implementation JYAndZXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //_category=[[NSString alloc]init];
    [self createTableView1];
    [self createAFhttpRequest];
    [self firstDownLoad];


    [self createRefreshView];
    NSLog(@"count%ld",self.dataArr.count);
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(recive:) name:@"1" object:nil];



    // Do any additional setup after loading the view.
}
-(void)recive:(NSNotification *)nsno{
    NSDictionary *dict=nsno.userInfo;
    NSString *st=[dict objectForKey:@"1"];
    NSLog(@"st%@",_zxdmodel.url);


    NSLog(@"我又被点击了");
        NSString *str=[NSString stringWithFormat:@"我在用友盟分享%@",st];
        [UMSocialSnsService presentSnsIconSheetView:self appKey:@"507fcab25270157b37000010" shareText:str shareImage:[UIImage imageNamed: @"10174123"] shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToQzone,UMShareToSms,UMShareToEmail,UMShareToWechatTimeline,nil]  delegate:self ];

}
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response{
    if (response.responseCode==UMSResponseCodeSuccess) {
        NSLog(@"share to sns name is %@",[[response.data allKeys]objectAtIndex:0]);
    }
}
-(void)createAFhttpRequest{
    self.manager = [AFHTTPRequestOperationManager manager];
    //返回二进制不解析
    self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
}
-(void)createTableView1{
    self.dataArr=[[NSMutableArray alloc]init];

    //创建导航栏
    UIImageView *Daoimage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 44)];
    [Daoimage setImage:[UIImage imageNamed: @"navigationbar"]];


    _biaoti=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-40, 5, 80, 34)];
    //_biaoti.text=@"交易策略";
    _biaoti.textAlignment=NSTextAlignmentCenter;
    _biaoti.font=[UIFont systemFontOfSize:18];
    _biaoti.textColor=[UIColor blackColor];
    [Daoimage addSubview:_biaoti];

    [Daoimage setBackgroundColor:[UIColor grayColor]];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(backbuttonClick1:) forControlEvents:UIControlEventTouchUpInside];
    button.frame=CGRectMake(15, 5, 40, 34);
    button.titleLabel.font=[UIFont systemFontOfSize:17];
    [Daoimage addSubview:button];
    Daoimage.userInteractionEnabled=YES;
    //创建tableview
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-49) style:UITableViewStylePlain];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    self.tableView.separatorStyle=UITableViewCellSelectionStyleGray;
    [self.tableView registerNib:[UINib nibWithNibName:@"ZXCell" bundle:nil] forCellReuseIdentifier:@"ZXCell"];
    [self.view addSubview:self.tableView];
    [self.view addSubview:Daoimage];
    //添加底部视图
    UIImageView *dibu=[[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-49, self.view.bounds.size.width, 49)];
    dibu.backgroundColor=[UIColor whiteColor];
    UIButton *shouye=[UIButton buttonWithType:UIButtonTypeCustom];
    shouye.frame=CGRectMake(16, 7, 71, 30);
    [shouye setTitle:@"首页" forState:UIControlStateNormal];
    [shouye setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [shouye addTarget:self action:@selector(shouye:) forControlEvents:UIControlEventTouchUpInside];

    shouye.titleLabel.font=[UIFont boldSystemFontOfSize:20];
    shouye.titleLabel.textAlignment=NSTextAlignmentCenter;

    [dibu addSubview:shouye];
    dibu.userInteractionEnabled=YES;
 UIButton *next=[UIButton buttonWithType:UIButtonTypeCustom];
    next=[UIButton buttonWithType:UIButtonTypeCustom];
    next.frame=CGRectMake(self.view.frame.size.width/2-64, 7, 128, 30);
    [next setTitle:@"全球市场" forState:UIControlStateNormal];
    [next setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [next addTarget:self action:@selector(nextClick:) forControlEvents:UIControlEventTouchUpInside];
    next.titleLabel.font=[UIFont  boldSystemFontOfSize:20];
    next.titleLabel.textAlignment=NSTextAlignmentCenter;

    [dibu addSubview:next];
    //返回资讯中心
    UIButton *center=[UIButton buttonWithType:UIButtonTypeCustom];
    center.frame=CGRectMake(self.view.frame.size.width-110, 7, 110, 30);
    [center setTitle:@"黄金行情" forState:UIControlStateNormal];
    [center setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [center addTarget:self action:@selector(center:) forControlEvents:UIControlEventTouchUpInside];

    center.titleLabel.font=[UIFont boldSystemFontOfSize:20];
    center.titleLabel.textAlignment=NSTextAlignmentCenter;

    [dibu addSubview:center];
    [self.view addSubview:dibu];
}

//设置首页返回
-(void)shouye:(UIButton *)button{
    RootViewController *hh=[[RootViewController alloc]init];

    [self presentViewController:hh animated:YES completion:nil];
}


//调转到全球市场
-(void)nextClick:(UIButton *)button{
    QQSCViewController *hh=[[QQSCViewController alloc]init];

    [self presentViewController:hh animated:YES completion:nil];
}
//跳转到资讯中心
-(void)center:(UIButton *)button{
    HJHQViewController *hh=[[HJHQViewController alloc]init];

    [self presentViewController:hh animated:YES completion:nil];
    
}



-(void)addTaskWithUrl:(NSString *)url isRefresh:(BOOL)isRefresh{
    __weak typeof(self) weakSelf=self;
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleDrop];
    //设置标题
    [MMProgressHUD showWithTitle:@"刷新数据中" status:@"loading...."];
    BOOL isExist=[[NSFileManager defaultManager]fileExistsAtPath:[LZXHelper getFullPathWithFile:url]];
    BOOL isTimeOut=[LZXHelper isTimeOutWithFile:[LZXHelper getFullPathWithFile:url] timeOut:60*60];
    if ((isExist==YES)&&(isRefresh==NO)&&(isTimeOut==NO)) {
        //满足三个条件走本地
        //读缓存
        NSData *data=[NSData dataWithContentsOfFile:[LZXHelper getFullPathWithFile:url]];
        //json 解析
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *appArr=dict[@"results"];
        for (NSDictionary *Dict in appArr) {
            ZXDModel *model=[[ZXDModel alloc]init];
            [_zxdmodel setValuesForKeysWithDictionary:Dict];
            _zxdmodel=model;
            [weakSelf.dataArr addObject:_zxdmodel];
        }
        [weakSelf.tableView reloadData];
        [MMProgressHUD dismissWithSuccess:@"OK" title:@"下载本地数据完成"];
        return;

    }
//下载走的是网络请求下载 
    [self.manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) {
            if (weakSelf.currentPage==1) {
                [weakSelf.dataArr removeAllObjects];
                //普通文件缓存
                [[NSFileManager defaultManager]createFileAtPath:[LZXHelper getFullPathWithFile:url] contents:responseObject attributes:nil];
            }
           // [weakSelf.dataArr removeAllObjects];
           //json 解析
            NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSArray *appArr=dict[@"results"];
            for (NSDictionary *Dict in appArr) {
                ZXDModel *model=[[ZXDModel alloc]init];
                [model setValuesForKeysWithDictionary:Dict];
                [weakSelf.dataArr addObject:model];
            }
            [weakSelf.tableView reloadData];




        }
        [weakSelf endRefreshing];
        [MMProgressHUD dismissWithSuccess:@"OK" title:@"下载网络数据"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"下载失败");
        [weakSelf endRefreshing];
        [MMProgressHUD dismissWithError:@"Error" title:@"下载数据"];


    }];
}
-(void)firstDownLoad{
    self.isRefreshing=NO;
    self.isLoadMore=NO;
    self.currentPage=1;
    NSString *url=nil;
    url=[NSString stringWithFormat:XINWEN,self.category,self.currentPage];
    NSLog(@"打印%@",_category);
    [self addTaskWithUrl:url isRefresh:NO];
}
-(void)createRefreshView{
    __weak typeof(self) weakSelf=self;
    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isRefreshing) {
            return ;
        }
        weakSelf.isRefreshing=YES;
        weakSelf.currentPage=1;
        NSString *url=nil;
         url=[NSString stringWithFormat:XINWEN,weakSelf.category,weakSelf.currentPage];
        [weakSelf addTaskWithUrl:url isRefresh:YES];

    }];
    //上拉加载更多
    [self.tableView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        //重新下载数据
        if (weakSelf.isLoadMore) {
            return ;
        }
        weakSelf.isLoadMore=YES;
        weakSelf.currentPage++;
        NSString *url=nil;
  url=[NSString stringWithFormat:XINWEN,weakSelf.category,weakSelf.currentPage];
        [weakSelf addTaskWithUrl:url isRefresh:YES];


    }];

}
-(void)backbuttonClick1:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];

    
}
-(void)endRefreshing{
    if (self.isRefreshing) {
        self.isRefreshing=NO;
        [self.tableView headerEndRefreshingWithResult:JHRefreshResultNone];
    }
    if (self.isLoadMore) {
        self.isLoadMore=NO;
        [self.tableView footerEndRefreshing];
    }

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"count%ld",self.dataArr.count);

    return self.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ZXCell" forIndexPath:indexPath];
    ZXDModel *model=self.dataArr[indexPath.row];
    [cell showDataWithModel:model indexPath:indexPath];
    cell.layer.borderWidth=0.8;
    cell.layer.borderColor=[UIColor grayColor].CGColor;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 94.0;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -选中cell

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    XiangqingViewController *xiangqing=[[XiangqingViewController alloc]init];
    ZXDModel *model=self.dataArr[indexPath.row];
    /* NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com/index.php?tn=monline_3_dg"]];
*/
  // NSString *str=[NSString stringWithFormat:<#(NSString *), ...#>]
    xiangqing.request=[NSURLRequest requestWithURL:[NSURL URLWithString:model.url]];
    xiangqing.urll=model.url;
    NSLog(@"model.url %@",model.url);
    xiangqing.modell=model;
    

    //[self presentModalViewController:hh animated:YES];
    [self presentViewController:xiangqing animated:YES completion:nil];
    
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
