//
//  APPInfoManager.h
//  DNF
//
//  Created by 贺东方 on 16/2/23.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APPInfoManager : NSObject
+ (id)sharedManager;
/**
 *  职业攻略是否已经选择过职业，如果已经选择过，就直接跳转到该职业的页面
 如果没有选择过则跳转到职业选择页面
 */
@property (nonatomic,assign)BOOL isJobsChoosed;
@end
