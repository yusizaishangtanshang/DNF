//
//  NewsModel.h
//  DNF
//
//  Created by 贺东方 on 16/1/24.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NewsTableViewCellFrame;
@interface NewsModel : NSObject
/**
 *  ID
 */
@property (nonatomic,copy)NSString *idStr;
/**
 *  描述的问题
 */
@property (nonatomic,copy)NSString *desc;
/**
 *  标题
 */
@property (nonatomic,copy)NSString *title;
/**
 *  图片链接，有的有有的没有
 */
@property (nonatomic,copy)NSString *pic_url;
/**
 *  视频链接，同上
 */
@property (nonatomic,copy)NSString *video_url;
/**
 *  暂时不知道
 */
@property (nonatomic,strong)NSNumber* published;
/**
 *  是否为热点
 */
@property (nonatomic,copy)NSString *is_hot;
/**
 *  平台，iOS或者Android
 */
@property (nonatomic,copy)NSString *platform;
/**
 *  推荐
 */
@property (nonatomic,assign)NSInteger recommend;

@property (nonatomic,strong)NewsTableViewCellFrame *cellFrame;

- (instancetype)initWithDic:(NSDictionary *)dic;
@end
