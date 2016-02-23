//
//  GuideDockViewController.m
//  DNF
//
//  Created by 贺东方 on 16/2/22.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#import "GuideDockViewController.h"
#import "GuideViewController.h"
#import "NewsViewController.h"
@interface GuideDockViewController ()

@end

@implementation GuideDockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addDock];
    NSLog(@"----" );
}

#pragma mark 添加Dock
- (void)addDock
{
    CGRect rect = CGRectMake(0, kScreenHeight - 49, kScreenWidth, 49);
    Dock *dock = [[Dock alloc]initWithFrame:rect];
    dock.backgroundColor = [UIColor grayColor];
    dock.delegate = self;
    [self.view addSubview:dock];

    //往Dock添加选项卡
    CGSize size = CGSizeMake(200, 200);
    UIImage *selected = [self imageWithColor:color(32, 32, 30) size:size];
    UIImage *normal = [self imageWithColor:color(42, 41, 39) size:size];
    [dock addItemWithTitle:@"攻略" NormalImage:normal SelectedImage:selected];
    [dock addItemWithTitle:@"技能" NormalImage:normal SelectedImage:selected];
    [dock addItemWithTitle:@"装备" NormalImage:normal SelectedImage:selected];
    [dock addItemWithTitle:@"介绍" NormalImage:normal SelectedImage:selected];
    NSMutableArray *arrControllers = [NSMutableArray array];
//    GuideViewController *guide =  [[GuideViewController alloc]init];
    for (NSInteger i = 0; i<4; i++) {
         NewsViewController *new = [[NewsViewController alloc]initWithUrl:@"http://dnf.zhangyoubao.com/apis/rest/ItemsService/lists/?&cattype=guide&roleid=10057&page=1&i_=63f2ee4574296ff32b18ea05e80df97baf22771b&t_=1453006368&p_=21449&v_=3050205&d_=ios&dv_=9.2&version=0" Title:@"shouhuzhe"];
        [arrControllers addObject:new];
    }
    self.viewControllers = arrControllers;
    NSLog(@"----" );

}
/**
 *  生成纯色图片
 *
 *  @param color 颜色
 *  @param size  大小
 *
 *  @return 返回一张图片
 */
- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
#pragma mark dock的代理方法
- (void)dock:(Dock *)dock itemSelectedFrom:(int)from to:(int)to
{
    self.selectedIndex = to;
}


@end
