//
//  GuideViewController.h
//  DNF
//
//  Created by 贺东方 on 16/2/22.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuideViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MJKeyValue>
- initWithUrl:(NSString *)urlStr Title:(NSString *)title;
@end
