//
//  MenuTableViewController.m
//  DNF
//
//  Created by 贺东方 on 16/1/17.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#define kLeftMenuCellReuseId @"MenuCellid"


#import "MenuTableViewController.h"
#import "NewsViewController.h"
#import "REFrostedViewController.h"
#import "GuideDockViewController.h"
@interface MenuTableViewController ()
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong) NSArray *arrControllers;
@property(nonatomic, strong) NSArray *arrTitles;
@property(nonatomic, strong) NSArray *arrImages;

@property(nonatomic, strong) UIColor *titleColor;
@property(nonatomic, strong) UIColor *backgroundColor;
@property(nonatomic, strong) UIColor *selectedColor;
@property(nonatomic, assign) NSInteger previousRow;
@end
@implementation MenuTableViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self.slideOutAnimationEnabled = YES;
    
    return [super initWithCoder:aDecoder];
}
- (id)initWithMenus:(NSArray *)titles MenuImages:(NSArray *)images ViewControllers:(NSArray *)controllers{
    //NSParameterAssert(titles);
    self.slideOutAnimationEnabled = YES;
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [_tableView setDataSource:self];
    [_tableView setDelegate:self];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    _tableView.separatorColor = [UIColor lightGrayColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftMenu.jpg"]];
    _tableView.backgroundView = imageView;
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kLeftMenuCellReuseId];
    self = [super init];
    if (self) {
        _arrTitles = titles;
        _arrImages = images;
        _arrControllers = controllers;
        
        [self.view addSubview:_tableView];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
//    NSLog(@"frame width:%f,heigth:%f",self.view.frame.size.width,self.view.frame.size.height);
    
    self.view.layer.borderWidth = .6;
    self.view.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_arrTitles count]; //多一个sign out
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 20)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  (kScreenHeight - 120)/9;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kLeftMenuCellReuseId forIndexPath:indexPath];
    cell.textLabel.text = [_arrTitles objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[_arrImages objectAtIndex:indexPath.row]];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc = [_arrControllers objectAtIndex:indexPath.row];
    self.frostedViewController.contentViewController = vc;
    [self.frostedViewController hideMenuViewController];

}

@end
