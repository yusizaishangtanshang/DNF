//
//  AdsModel.m
//  DNF
//
//  Created by 贺东方 on 16/2/17.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#import "AdsModel.h"

@implementation AdsModel
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.title = dic[@"title"];
        self.desc = dic[@"desc"];
        self.id = dic[@"id"];
        self.pic_ad_url = dic[@"pic_ad_url"];
        NSDictionary *dicGoto = dic[@"goto_param"];
        self.itemid = dicGoto[@"itemid"];
    }
    return self;
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
