//
//  NewsViewController.h
//  DNF
//
//  Created by 贺东方 on 16/1/21.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Request.h"
#import "MJExtension/MJExtension.h"
@interface NewsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MJKeyValue>

- initWithUrl:(NSString *)urlStr Title:(NSString *)title;
@end
