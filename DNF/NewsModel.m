//
//  NewsModel.m
//  DNF
//
//  Created by 贺东方 on 16/1/24.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.idStr = dic[@"id"];
        self.title = dic[@"title"];
        self.desc = dic[@"desc"];
        if ([dic[@"pic_url"] isEqualToString:@""]) {
//            NSLog(@"----no pic_url");
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
