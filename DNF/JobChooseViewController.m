//
//  JobChooseViewController.m
//  DNF
//
//  Created by 贺东方 on 16/2/22.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//
#define CELLID @"JobChooseCellId"
#import "JobChooseViewController.h"
#import "GuideCollectionViewCell.h"
@interface JobChooseViewController ()
@property (nonatomic,weak)UITableView *tableView;
@end

@implementation JobChooseViewController
{
    NSArray *arrJobs;
    NSArray *arrDetailJobs;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *DocumentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *path= [DocumentPath stringByAppendingPathComponent:@"Job.plist"];
    NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:path];
    arrJobs = dic[@"Job"];
    arrDetailJobs = dic[@"JobDetail"];
    
}

- (void)confTableView
{
    UICollectionView *collectView = [[UICollectionView alloc]initWithFrame:self.view.bounds];
    collectView.delegate =self;
    collectView.dataSource = self;
    [self.view addSubview:collectView];
}

- (NSInteger)numberOfSections
{
    return arrJobs.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [arrDetailJobs[section] count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GuideCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELLID forIndexPath:indexPath];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"GuideCollectionViewCell" owner:self options:nil]lastObject];
    }
    return  cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
