//
//  ShezhiViewController.m
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/8/24.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#import "ShezhiViewController.h"
#import "SDImageCache.h"

@interface ShezhiViewController ()

@end

@implementation ShezhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//或者缓存大小
-(double)getCacheSize{
    //1.自定义的缓存 2.sd的缓存
    NSUInteger sdFileSize=[[SDImageCache sharedImageCache]getSize];
    //先获取 系统 library/Caches 路径
    NSString *caches=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *myCachesPath=[caches stringByAppendingPathComponent:@"MyCaches"];
    NSDirectoryEnumerator *enumrator=[[NSFileManager defaultManager]enumeratorAtPath:myCachesPath];
    NSUInteger mySize=0;
    //遍历枚举器
    for (NSString *fileName in enumrator) {
        //文件路径
        NSString *filePath=[myCachesPath stringByAppendingPathComponent:fileName];
        NSDictionary *fileDict=[[NSFileManager defaultManager]attributesOfItemAtPath:filePath error:nil];
        //获取大小
        mySize +=fileDict.fileSize;//字节大小

    }
    return (mySize+sdFileSize)/1024.0/1024.0;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)BAckClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)ClearClick:(UIButton *)sender {
    UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:[NSString stringWithFormat:@"清除缓存:%.6fM",[self getCacheSize]] delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"删除" otherButtonTitles:nil];
    [actionSheet showInView:self.view];

}
//点击操作表单的按钮
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==actionSheet.destructiveButtonIndex) {
        //删除
        //1 删除 sd
        [[SDImageCache sharedImageCache]clearMemory];//清除内存缓存
        // 2 清除磁盘缓存
        [[SDImageCache sharedImageCache]clearDisk];
        //清除字节的缓存
        NSString *caches=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
        NSString *myCachesPaht=[caches stringByAppendingPathComponent:@"MyCaches"];
        //删除
        [[NSFileManager defaultManager]removeItemAtPath:myCachesPaht error:nil];
    }
}

@end
