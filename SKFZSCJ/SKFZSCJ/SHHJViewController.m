//
//  SHHJViewController.m
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/7/28.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import "SHHJViewController.h"
#import "MyTableViewCell.h"
#import "NameCell.h"
#import "RootViewController.h"
#import "QQSCViewController.h"
#import "JYCLViewController.h"

#import "JHRefresh.h"
#import "GoldModel.h"



@interface SHHJViewController ()

@end

@implementation SHHJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
  
    [self createTableView];
    [self createAFHttpRequest];
    [self firstDownload];
    [self createRefreshView];

    }
-(void)createAFHttpRequest{
    self.manager = [AFHTTPRequestOperationManager manager];
    //返回二进制不解析
    self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createTableView{
    self.dataArr=[[NSMutableArray alloc]init];
    //设置名称数组
     UIImageView *Daoimage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 44)];
    [Daoimage setImage:[UIImage imageNamed: @"navigationbar"]];
    UILabel *tixing=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width-100, 20, 100, 18)];
    tixing.text=@"下拉可刷新数据";
    //tixing.textAlignment=NSTextAlignmentLeft;
    tixing.font=[UIFont boldSystemFontOfSize:13];
    tixing.textColor=[UIColor blackColor];
    [Daoimage addSubview:tixing];
    //设置导航栏标题 
    _biaoti=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-70, 5, 140, 34)];
    _biaoti.textAlignment=NSTextAlignmentCenter;
    _biaoti.font=[UIFont systemFontOfSize:18];
    _biaoti.textColor=[UIColor blackColor];
    [Daoimage addSubview:_biaoti];

    [Daoimage setBackgroundColor:[UIColor grayColor]];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [button addTarget:self action:@selector(backbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.frame=CGRectMake(15, 5, 40, 34);
    button.titleLabel.font=[UIFont systemFontOfSize:17];
    [Daoimage addSubview:button];
    Daoimage.userInteractionEnabled=YES;
    //创建tableView
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 42, 100*_py, self.view.frame.size.height-64-49-42) style:UITableViewStylePlain];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    //反弹
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;

    [self.tableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyTableViewCell"];
    //创建myScrollView
 _myScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(140, 64, self.view.frame.size.width, 650)];
    [_myScrollView setBackgroundColor:[UIColor blackColor]];
    self.tableView.backgroundColor=[UIColor blackColor];
    [_myScrollView addSubview:self.tableView];
    //[myScrollView setBackgroundColor:[UIColor blackColor]];
   _myScrollView.bounces=NO;
    _myScrollView.delegate=self;
    _myScrollView.contentSize=CGSizeMake(100*(_py+1)+30,self.tableView.frame.size.height);
    //self.nameArr=@[@"最新",@"开盘",@"最高",@"最低",@"昨收",@"涨跌",@"涨幅",@"成交量",@"昨结算",@"均价",@"成交额"];
    self.nameArr=[NSArray
                  arrayWithObjects:@"最新",@"开盘",@"最高",@"最低",@"昨收",@"涨跌",@"涨幅",@"成交量",@"昨结算",@"均价",@"成交额",nil];
    

    [NSArray
     arrayWithObjects:@"123",@"456",@"789",nil];

     //创建最上层各个标题
    UIView *mingcheng=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 42)];
    mingcheng.backgroundColor=[UIColor blackColor];
    for (int i=0; i<11; i++) {
        UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(100*i, 0, 100, 42)];
        NSArray *arry=[NSArray
                       arrayWithObjects:@"最新",@"开盘",@"最高",@"最低",@"昨收",@"涨跌",@"涨幅",@"成交量",@"昨结算",@"均价",@"成交额",nil];
        lable.text=arry[i];
        lable.textAlignment=NSTextAlignmentCenter;
        lable.textColor=[UIColor whiteColor];
        lable.font=[UIFont systemFontOfSize:17];
        [mingcheng  addSubview:lable];
    }

    UILabel *mingcheng2=[[UILabel alloc]initWithFrame:CGRectMake(0, 64, 140, 42)];
    mingcheng2.text=@"名称";
    mingcheng2.backgroundColor=[UIColor blackColor];
    mingcheng2.textAlignment=NSTextAlignmentCenter;
    mingcheng2.textColor=[UIColor whiteColor];
    mingcheng2.font=[UIFont systemFontOfSize:17];
    [self.view addSubview:mingcheng2];


    [_myScrollView addSubview:mingcheng];


    self.tableView2=[[UITableView alloc]initWithFrame:CGRectMake(0, 106, 140, self.tableView.frame.size.height) style:UITableViewStylePlain];
    self.tableView2.dataSource=self;
    self.tableView2.delegate=self;
    self.tableView2.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableView2.backgroundColor=[UIColor blackColor];

    [self.view addSubview:self.tableView2];
    [self.tableView2 registerNib:[UINib nibWithNibName:@"NameCell" bundle:nil] forCellReuseIdentifier:@"NameCell"];
    [self.view addSubview:Daoimage];
    [self.view setBackgroundColor:[UIColor blackColor]];
    self.tableView.sectionIndexTrackingBackgroundColor=[UIColor blackColor];
    self.tableView.sectionIndexColor=[UIColor blackColor];
    self.tableView.sectionIndexBackgroundColor=[UIColor blackColor];
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
    _next=[UIButton buttonWithType:UIButtonTypeCustom];
    _next.frame=CGRectMake(self.view.frame.size.width/2-64, 7, 128, 30);
    [_next setTitle:@"全球市场" forState:UIControlStateNormal];
    [_next setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_next addTarget:self action:@selector(nextClick:) forControlEvents:UIControlEventTouchUpInside];
    _next.titleLabel.font=[UIFont  boldSystemFontOfSize:20];
    _next.titleLabel.textAlignment=NSTextAlignmentCenter;

    [dibu addSubview:_next];
    //返回资讯中心
    UIButton *center=[UIButton buttonWithType:UIButtonTypeCustom];
    center.frame=CGRectMake(self.view.frame.size.width-71, 7, 71, 30);
    [center setTitle:@"资讯" forState:UIControlStateNormal];
    [center setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [center addTarget:self action:@selector(center:) forControlEvents:UIControlEventTouchUpInside];

    center.titleLabel.font=[UIFont boldSystemFontOfSize:20];
    center.titleLabel.textAlignment=NSTextAlignmentCenter;

    [dibu addSubview:center];

   [self.view addSubview:_myScrollView];

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
    JYCLViewController *hh=[[JYCLViewController alloc]init];

    [self presentViewController:hh animated:YES completion:nil];

}




-(void)addTaskWithUrl:(NSString *)url isRefresh:(BOOL)isRefresh{
    __weak typeof(self) weakSelf=self;
    [self.manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) {

               [weakSelf.dataArr removeAllObjects];
        //json 解析
        NSArray *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary *Dict in dict) {
            GoldModel *model=[[GoldModel alloc]init];
            [model setValuesForKeysWithDictionary:Dict];
            //model.Open=Dict[@"Open"];


            [weakSelf.dataArr addObject:model];

}
            [weakSelf.tableView reloadData];
            [weakSelf.tableView2 reloadData];

}
        [weakSelf endRefreshing];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"下载失败");
        [weakSelf endRefreshing];
    }];

}
-(void)firstDownload{
    self.isRefreshing=NO;
    self.isloadMore=NO;
    NSString *url=nil;
    url=[NSString stringWithFormat:GUIjinshuUel,self.category];
    [self addTaskWithUrl:url isRefresh:NO];
}
-(void)createRefreshView{

    __weak typeof(self) weakSelf=self;

    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        //[weakSelf.dataArr removeAllObjects];

        if (weakSelf.isRefreshing) {
            return ;
        }
        weakSelf.isRefreshing=YES;
        NSString *url=nil;
        url=[NSString stringWithFormat:GUIjinshuUel,weakSelf.category];

        
        [weakSelf addTaskWithUrl:url isRefresh:YES];



    }];


}
-(void)endRefreshing{
    if (self.isRefreshing) {
        self.isRefreshing=NO;
        [self.tableView headerEndRefreshingWithResult:JHRefreshResultNone];
    }
    if (self.isloadMore) {
        self.isloadMore=NO;
        [self.tableView footerEndRefreshing];
    }
}


-(void)backbuttonClick:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];


}
#pragma mark -TableView协议

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if ([tableView isEqual: _tableView]) {
        return 1;
    }
   else if([tableView isEqual:_tableView2]) {
        return 1;
    }
    return 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([tableView isEqual: _tableView]) {
                  return self.dataArr.count;
    }
   else if([tableView isEqual:_tableView2]) {
       
       return self.dataArr.count;
    }
    return 0;
   
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual: _tableView]) {


    MyTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"MyTableViewCell" forIndexPath:indexPath];
     



    GoldModel *model=self.dataArr[indexPath.row];
    [cell showDataWithModel:model indexPath:indexPath];


    

        return cell;}
     else  if([tableView isEqual:_tableView2])
     {  NameCell *cell=[tableView dequeueReusableCellWithIdentifier:@"NameCell" forIndexPath:indexPath];
        GoldModel *model=self.dataArr[indexPath.row];
            [cell showDataWithModel:model indexPath:indexPath];

         return cell;
        
    }
        return nil;


}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 42.0;

}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY=self.tableView.contentOffset.y;
    CGPoint nameoffsetY=self.tableView2.contentOffset;
    nameoffsetY.y=offsetY;
    self.tableView2.contentOffset=nameoffsetY;
    if (offsetY==0) {
        self.tableView2.contentOffset=CGPointZero;

    }

   
    //设置横向
    



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
