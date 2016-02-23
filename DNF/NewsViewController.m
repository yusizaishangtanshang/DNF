//
//  NewsViewController.m
//  DNF
//
//  Created by 贺东方 on 16/1/21.
//  Copyright © 2016年 hexiaoyi. All rights reserved.

#define CELLID @"cellid"
#define ADHEIGHT 150
#import "NewsViewController.h"
#import "Request.h"
#import "NewsModel.h"
#import "AdsModel.h"
#import "NewsTableViewCell.h"
#import "NewsTableViewCellFrame.h"
#import "DCPicscrollView/DCPicScrollView.h"
#import "DCPicscrollView/DCWebImageManager.h"
#import "DetailViewController.h"
#import "MenuTableViewController.h"
@interface NewsViewController ()
@property (nonatomic,strong)UITableView *tableView;
//@property (nonatomic,strong)NSMutableArray *arrModels;
@property (nonatomic,strong)NSMutableArray *arrCellFrames;
@property (nonatomic,strong)NSMutableArray *arrAds;
@property (nonatomic,copy)NSString *urlStr;
@property (nonatomic,copy)NSString *titleStr;
@end

@implementation NewsViewController
{
    int page;
    BOOL isRefreshing;
    NSMutableArray *arrTitles;
    NSMutableArray *arrPicUrls;
}
- initWithUrl:(NSString *)urlStr Title:(NSString *)title
{
    self = [super init];
    if (self) {
        self.titleStr = title;
        self.urlStr = urlStr;
    }
    return  self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self confBase];
    [self downLoadData];
    [self confTableView];
    [self confAdvertise];
    [self setUpRefresh];
}

#pragma 一些基础的东西
- (void)confBase
{
    isRefreshing = NO;
    page = 1;
    self.view.backgroundColor = [UIColor grayColor];
    self.title = self.titleStr;
    UIBarButtonItem *returnItem = [[UIBarButtonItem alloc]init];
    returnItem.title = @"";
    self.navigationController.navigationItem.backBarButtonItem = returnItem;
    self.tabBarController.tabBar.hidden = YES;
    self.arrCellFrames = [NSMutableArray array];
    self.arrAds = [NSMutableArray array];
}
#pragma 下载数据
- (void)downLoadData
{
    [self getAdsData];
    [self getListData];
}
- (void)getAdsData
{
    NSString *urlAdsStr = apiAds;
    [Request requestWithGetApiAndParameter:nil withUrl:urlAdsStr withJsonCallBack:^(id data) {
        NSDictionary *dicData = (NSDictionary *)data;
        NSArray *arrData = dicData[@"data"];
        if (self.arrAds.count != 0) {
            [self.arrAds removeAllObjects];
        }
        /**
         *  在这里创建model，并且把model加入到某个数组中，以便下一步使用
         */
        for (NSDictionary *dictionary in arrData) {
            AdsModel *model = [[AdsModel alloc]initWithDic:dictionary];
            [self.arrAds addObject:model];
        }
    }];
}

- (void)getListData
{
    NSString *urlListStr = [NSString stringWithFormat:self.urlStr,page];
    [Request requestWithGetApiAndParameter:nil withUrl:urlListStr withJsonCallBack:^(id data) {
        NSDictionary *dicData = (NSDictionary *)data;
        
        NSArray *arrData = dicData[@"data"];
        /**
         *  在这里创建model，并且把model加入到某个数组中，以便下一步使用
         */
        for (NSDictionary *dictionary in arrData) {
            NewsModel *model = [[NewsModel alloc]initWithDic:dictionary];
            //                [_arrModels addObject:model];
            NewsTableViewCellFrame *cellFrame = [[NewsTableViewCellFrame alloc]init];
            cellFrame.model = model;
            [self.arrCellFrames addObject:cellFrame];
        }
        [self.tableView reloadData];
        if (isRefreshing) {
            [self.tableView.mj_header endRefreshing];
        }else
        {
            [self.tableView.mj_footer endRefreshing];
        }
    }];
}

#pragma 控件配置
- (void)confTableView

{
    float y = kTabBarHeight;
    float height = kScreenHeight - y;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake( 0, y, kScreenWidth, height) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor grayColor];
//    _tableView.rowHeight = 110;
    [self.view addSubview:_tableView];
    
}

- (void)confAdvertise
{

    

}
/**
 *  集成刷新控件
 */
- (void)setUpRefresh
{
    MJRefreshAutoFooter *foot = [[MJRefreshAutoFooter alloc]init];
    foot.automaticallyRefresh = YES;
    foot.automaticallyHidden = YES;
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
//    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadMoreData];
    }];
}
/**
 *  刷新数据
 */
- (void)loadNewData
{
    page = 1;
    isRefreshing = YES;
    [self.arrCellFrames removeAllObjects];
    [self downLoadData];
}
/**
 *  加载更多
 */
- (void)loadMoreData
{
    page ++;
    isRefreshing = NO;
    [self downLoadData];
//    [self.tableView.mj_footer endRefreshingWithNoMoreData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    arrTitles = [NSMutableArray array];
    arrPicUrls = [NSMutableArray array];
    for (AdsModel *model in self.arrAds) {
        [arrTitles addObject:model.title];
        [arrPicUrls addObject:model.pic_ad_url];
    }
//    NSLog(@"%lu",(unsigned long)arrPicUrls.count );
    DCPicScrollView *adsView = [DCPicScrollView picScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, ADHEIGHT) WithImageUrls:arrPicUrls];
    adsView.titleData = arrTitles;
    [adsView setImageViewDidTapAtIndex:^(NSInteger index) {
        NSLog(@"%ld",(long)index );
    }];
    adsView.AutoScrollDelay = 1.0f;
    [[DCWebImageManager shareManager]setDownloadImageRepeatCount:2];
    [[DCWebImageManager shareManager]setDownLoadImageError:^(NSError * error, NSString *url) {
       NSLog(@"%@",error );
    }];
    return adsView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return ADHEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsTableViewCellFrame *cellFrame = self.arrCellFrames[indexPath.row];
    return cellFrame.cellHeight + 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrCellFrames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    if (!cell) {
        cell = [[NewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLID];
    }
    cell.cellFrame = self.arrCellFrames[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *dtVc = [[DetailViewController alloc]init];
    NewsTableViewCellFrame *model = self.arrCellFrames[indexPath.row];
    NSString *idStr = [NSString stringWithFormat:apiDetail,model.model.idStr];
    dtVc.url = idStr;
    [self.navigationController pushViewController:dtVc animated:YES];
}
@end
