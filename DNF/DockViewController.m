//
//  DockViewController.m
//  Dock
//
//  Created by 贺东方 on 15/8/8.
//  Copyright (c) 2015年 贺东方. All rights reserved.
//

#define __kScreenHeight [UIScreen mainScreen].bounds.size.height
#define __kScreenWidth [UIScreen mainScreen].bounds.size.width


#import "DockViewController.h"
#import "NewsViewController.h"
#import "NaviViewController.h"
@interface DockViewController ()<DockDelegate>

@end

@implementation DockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    [self addDock];
}

#pragma mark 添加Dock
- (void)addDock
{
    CGRect rect = CGRectMake(0, 64, __kScreenWidth, 49);
    Dock *dock = [[Dock alloc]initWithFrame:rect];
    dock.backgroundColor = [UIColor grayColor];
    dock.delegate = self;
    [self.view addSubview:dock];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:(NaviViewController *)self.navigationController
                                                                            action:@selector(showMenu)];
    //    [Request requestWithGetApiAndParameter:nil withUrl:apiCatogries withJsonCallBack:^(id data) {
    //
    //    }];
    //往Dock添加选项卡
    CGSize size = CGSizeMake(200, 200);
    UIImage *selected = [self imageWithColor:color(32, 32, 30) size:size];
    UIImage *normal = [self imageWithColor:color(42, 41, 39) size:size];
    [dock addItemWithTitle:@"全部" NormalImage:normal SelectedImage:selected];
    [dock addItemWithTitle:@"资讯" NormalImage:normal SelectedImage:selected];
    [dock addItemWithTitle:@"娱乐" NormalImage:normal SelectedImage:selected];
    [dock addItemWithTitle:@"活动" NormalImage:normal SelectedImage:selected];
    NSArray *arrUrl = @[@"http://dnf.zhangyoubao.com/apis/rest/ItemsService/lists/?&cattype=news&catid=0&page=%d&i_=63f2ee4574296ff32b18ea05e80df97baf22771b&t_=1453005677&p_=19376&v_=3050205&d_=ios&dv_=9.2&version=0",
                       @"http://dnf.zhangyoubao.com/apis/rest/ItemsService/lists/?&cattype=news&catid=10009&page=%d&i_=63f2ee4574296ff32b18ea05e80df97baf22771b&t_=1453006043&p_=20474&v_=3050205&d_=ios&dv_=9.2&version=0",
                       @"http://dnf.zhangyoubao.com/apis/rest/ItemsService/lists/?&cattype=news&catid=10003&page=%d&i_=63f2ee4574296ff32b18ea05e80df97baf22771b&t_=1453006095&p_=20630&v_=3050205&d_=ios&dv_=9.2&version=0",
                        @"http://dnf.zhangyoubao.com/apis/rest/ItemsService/lists/?&cattype=news&catid=10181&page=%d&i_=63f2ee4574296ff32b18ea05e80df97baf22771b&t_=1453006141&p_=20768&v_=3050205&d_=ios&dv_=9.2&version=0"
                       ];
    NSArray *arrTitle = @[@"全部",@"资讯",@"活动",@"娱乐"];
    NSMutableArray *arrVc = [NSMutableArray array];
    for (NSInteger i = 0; i < 4; i++) {
         NewsViewController *news = [[NewsViewController alloc]initWithUrl:arrUrl[i] Title:arrTitle[i]];
        [arrVc addObject:news];
    }
    self.viewControllers  = arrVc;
    
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
