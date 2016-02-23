//
//  MenuTableViewController.h
//  DNF
//
//  Created by 贺东方 on 16/1/17.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
@interface MenuTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;
- (id)initWithMenus:(NSArray *)titles MenuImages:(NSArray *)images ViewControllers:(NSArray *)controllers;

@end
