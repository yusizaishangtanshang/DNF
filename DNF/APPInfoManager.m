//
//  APPInfoManager.m
//  DNF
//
//  Created by 贺东方 on 16/2/23.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#import "APPInfoManager.h"
static APPInfoManager *_InfoManage;
@implementation APPInfoManager
+ (id)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _InfoManage = [[APPInfoManager alloc] init];
    });
    return _InfoManage;
}

@end
