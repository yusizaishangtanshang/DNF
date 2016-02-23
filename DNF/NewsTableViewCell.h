//
//  NewsTableViewCell.h
//  DNF
//
//  Created by 贺东方 on 16/1/25.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
#import "NewsTableViewCellFrame.h"
//typedef NS_OPTIONS(NSInteger, NewsCellType)
//{
//    NewsCellTypeDefault = 0,
//    NewsCellTypePicture
//};
@interface NewsTableViewCell : UITableViewCell
/**
 *  图片，有的有，有的没有
 */
@property (weak, nonatomic)  UIImageView *imgv;
/**
 *  文字
 */
@property (weak, nonatomic)  UILabel *LblText;
/**
 *  标题
 */
@property (nonatomic,strong)UILabel *LblTitle;
/**
 *  日期
 */
@property (weak, nonatomic)  UILabel *LblDate;
/**
 *  NewsCellType
 */
//@property (nonatomic,assign) NewsCellType type;
//@property (nonatomic,strong) NewsModel *model;
@property (nonatomic,strong) NewsTableViewCellFrame *cellFrame;
@end
