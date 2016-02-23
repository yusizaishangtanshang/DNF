//
//  GuideModel.m
//  DNF
//
//  Created by 贺东方 on 16/2/22.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#import "GuideModel.h"

@implementation GuideModel
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.idStr = dic[@"id"];
        self.title = dic[@"title"];
        self.desc = dic[@"desc"];
        if ([dic[@"pic_url"] isEqualToString:@""]) {
        }
        else{
            self.pic_url = dic[@"pic_url"];
        }
        self.video_url = dic[@"video_url"];
        self.published = (NSNumber*)dic[@"published"];
        self.is_hot = dic[@"is_hot"];
        self.platform = dic[@"platform"];
        self.recommend = (NSInteger)dic[@"recommend"];
    }
    return self;
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
