//
//  Request.h
//  AFNtest
//
//  Created by 贺东方 on 16/1/18.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

//对AFNetworking的封装
#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import <UIImageView+AFNetworking.h>

typedef void(^callBack)(id data);
@interface Request : NSObject

///
+ (void)requestWithGetApiAndParameter:(NSDictionary *)apiAndParameter withUrl:(NSString *)urlStr withDataCallBack:(callBack)callback;
+ (void)requestWithGetApiAndParameter:(NSDictionary *)apiAndParameter withUrl:(NSString *)urlStr withJsonCallBack:(callBack)callback;


+ (void)requestWithPostApiAndParameter:(NSDictionary *)apiAndParameter withUrl:(NSString *)urlStr withCallBack:(callBack)callback ;

- (void)uploadPictures:(NSArray *)picNames;

@end
