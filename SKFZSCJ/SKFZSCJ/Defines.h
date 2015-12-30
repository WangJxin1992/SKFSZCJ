//
//  Defines.h
//  SKFZSCJ
//
//  Created by qianfeng007 on 15/7/26.
//  Copyright (c) 2015年 孙凯峰. All rights reserved.
//

#ifndef SKFZSCJ_Defines_h
#define SKFZSCJ_Defines_h
#import "MyControl.h"
//增加下载数据特效
#import "MMProgressHUD.h"
//可以把一个秒转化为时间
#import "LZXHelper.h"
//所有的贵金属接口
/*http://m.fx678.com/quotelist.aspx?key=shgold*/
#define GUIjinshuUel @"http://m.fx678.com/quotelist.aspx?key=%@"
/*http://m.fx678.com/quotelist.aspx?key=shqh*/
/*
 category对应的字符串 为 ：

 */

#define kshgold @"shgold" //上海黄金
#define khjxh @"hjxh" // 国际黄金
#define kttj @"ttj" //  天交所
#define kygy @"ygy" // 粤贵银
#define kwh @"wh" //  外汇
#define kstockindex @"stockindex" // 全球股指
#define knymex @"nymex" // NYME原油
#define kcomex @"comex" // COMEX期金
#define kshqh @"shqh" // 上海期货
#define kipe @"ipe" //IPE原油
//新闻类的接口
#define XINWEN @"http://api.wallstreetcn.com:80/v2/posts?%@&page=%ld"
//http://api.wallstreetcn.com:80/v2/posts?type=news,ruanwen&page=1&_eva_t=1438761987
//http://api.wallstreetcn.com:80/v2/posts?type=news,ruanwen&page=1&_eva_t=1438762475




/*新闻类category对应的字符串 为 ：*/
#define kquanqiu @"type=news,ruanwen" //全球
#define kzuire @"alias=hotNews" // 最热
#define ktuijian @"cid=11" //  推荐
#define kmeiguo @"cid=16" // 美国
#define kchina @"cid=17" //  中国
#define kouzhou @"cid=15" //  欧洲
#define kjingji @"cid=19" //  经济
#define kyanghang @"cid=20&page=1" //  央行
#define kgongsi @"cid=22&page=1" //  公司
#define kshichang @"cid=21" //  市场





#endif
