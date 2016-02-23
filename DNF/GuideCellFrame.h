//
//  GuideCellFrame.h
//  DNF
//
//  Created by 贺东方 on 16/2/22.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GuideModel;
@interface GuideCellFrame : NSObject
/**
 * 模型数据
 */
@property (nonatomic,assign)CGRect lblTExtFrame;
@property (nonatomic,assign)CGRect imgvFrame;
@property (nonatomic,assign)CGRect lblDataFrame;
@property (nonatomic,assign)CGRect lblTitleFrame;
@property (nonatomic,assign)CGFloat cellHeight;
@property (nonatomic,strong)GuideModel *model;
@end
