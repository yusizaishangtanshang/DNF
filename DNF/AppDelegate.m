//
//  AppDelegate.m
//  DNF
//
//  Created by 贺东方 on 16/1/17.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#import "AppDelegate.h"
#import "SlideNavigationController.h"
#import "DockViewController.h"
#import "MenuTableViewController.h"
#import "GuideDockViewController.h"
#import "REFrostedViewController.h"
#import "NaviViewController.h"
#import "GuideViewController.h"
#import "APPInfoManager.h"
@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    DockViewController *newDock = [[DockViewController alloc]init];
    GuideDockViewController *guideDock = [[GuideDockViewController alloc]init];
    NaviViewController *navGuide = [[NaviViewController alloc]initWithRootViewController:guideDock];
    NaviViewController *nav = [[NaviViewController alloc]initWithRootViewController:newDock];
    NSArray *arrTitles = @[ @"新闻资讯",@"职业攻略",@"查询助手",@"游戏视频",@"时装模拟",@"真人秀",@"游戏周边",@"个人中心",@"系统设置"];
    NSArray *arrImages = [NSArray arrayWithObjects:@"flower", @"flower", @"flower", @"flower",nil];
    NSArray *arrControllers = @[nav,navGuide];
    
    MenuTableViewController *leftMenu =  [[MenuTableViewController alloc]initWithMenus:arrTitles MenuImages:nil ViewControllers:arrControllers];
    REFrostedViewController *vc = [[REFrostedViewController alloc]initWithContentViewController: nav menuViewController:leftMenu];

    [[UINavigationBar appearance]setBarTintColor:color(29, 28, 27)];
    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
    self.window.rootViewController = vc;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
