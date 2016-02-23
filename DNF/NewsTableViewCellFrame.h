//
//  NewsTableViewCellFrame.h
//  DNF
//
//  Created by 贺东方 on 16/1/31.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NewsModel;
@interface NewsTableViewCellFrame : NSObject
/**
 * 模型数据
 */
@property (nonatomic,strong)NewsModel *model;
@property (nonatomic,assign)CGRect lblTExtFrame;
@property (nonatomic, assign)CGRect imgvFrame;
@property (nonatomic,assign)CGRect lblDataFrame;
@property (nonatomic,assign)CGRect lblTitleFrame;
@property (nonatomic,assign)CGFloat cellHeight;


@end
