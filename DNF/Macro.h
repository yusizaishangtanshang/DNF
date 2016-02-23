//
//  Macro.h
//  DNF
//
//  Created by 贺东方 on 16/1/24.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#import <Foundation/Foundation.h>


#define apiAdvertise @"http://dnf.zhangyoubao.com/apis/rest/CatalogsService/all/?cattype=news&i_=63f2ee4574296ff32b18ea05e80df97baf22771b&t_=1453005676&p_=19373&v_=3050205&d_=ios&osv_=9.2&version=0&a_=dnf"
#define apiList @"http://dnf.zhangyoubao.com/apis/rest/ItemsService/lists/?&cattype=news&catid=0&page=%d&i_=63f2ee4574296ff32b18ea05e80df97baf22771b&t_=1453005677&p_=19376&v_=3050205&d_=ios&dv_=9.2&version=0"
#define apiCatogries @"http://dnf.zhangyoubao.com/apis/rest/CatalogsService/all/?cattype=news&i_=63f2ee4574296ff32b18ea05e80df97baf22771b&t_=1453005676&p_=19373&v_=3050205&d_=ios&osv_=9.2&version=0&a_=dnf"
#define apiAds @"http://dnf.zhangyoubao.com/apis/rest/ItemsService/ads/?&i_=63f2ee4574296ff32b18ea05e80df97baf22771b&t_=1453005676&p_=19373&v_=3050205&d_=ios&dv_=9.2&version=0"
#define apiDetail @"http://dnf.zhangyoubao.com/mobiles/item/%@?dw=320&i_=16660801b2a786dc2f057ffa2aac291f&t_=1455938662&p_=28331&v_=3060101&d_=ios&dv_=9.2.1"

#define color(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
//#define kNaviHeight 44
#define kTabBarHeight 49

@interface Macro : NSObject

@end
