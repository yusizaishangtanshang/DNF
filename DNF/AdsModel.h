//
//  AdsModel.h
//  DNF
//
//  Created by 贺东方 on 16/2/17.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdsModel : NSObject
/**
 *  描述
 */
@property (nonatomic,copy)NSString *desc;

@property (nonatomic,copy)NSString *id;
/**
 *  图片
 */
@property (nonatomic,copy)NSString *pic_ad_url;
/**
 *  标题
 */
@property (nonatomic,copy)NSString *title;
/**
 *  跳转后的ID
 */
@property (nonatomic,copy)NSString *itemid;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
