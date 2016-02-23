//
//  NewsTableViewCellFrame.m
//  DNF
//
//  Created by 贺东方 on 16/1/31.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#define padding  10
#define dataHeight 20
#define isPic_urlExist [model.pic_url isEqualToString:@""] || model.pic_url == NULL
#import "NewsTableViewCellFrame.h"
#import "NewsModel.h"
@implementation NewsTableViewCellFrame
- (void)setModel:(NewsModel *)model
{
    _model = model;
    CGFloat imgvX = 0;
    CGFloat imgvY = 0;
    CGFloat imgvWidth = 0;
    CGFloat imgvHeight = 0;
//    NSLog(@"%@",model.pic_url );
    if ([model.pic_url isEqualToString:@""] || model.pic_url == NULL) {


    }else
    {
        imgvX = padding;
        imgvY = padding;
        imgvWidth = 90;
        imgvHeight = 90;
    }

    self.imgvFrame = CGRectMake(imgvX, imgvY, imgvWidth, imgvHeight);
    
    CGFloat lblTitleX = imgvX + imgvWidth+ padding;
    CGFloat lblTitleY = imgvY;
        CGFloat lblTitleWidth = 0;
    if (isPic_urlExist) {
        lblTitleWidth = kScreenWidth - imgvWidth - padding * 2;
    }else{
        lblTitleWidth = kScreenWidth - imgvWidth - padding * 3;
    }
    CGSize sizeTitle =[self sizeWithString:model.title font:[UIFont systemFontOfSize:20] maxSize:CGSizeMake(lblTitleWidth, MAXFLOAT)];
    CGFloat lblTitleHeight =sizeTitle.height;
    self.lblTitleFrame = CGRectMake(lblTitleX, lblTitleY, lblTitleWidth, lblTitleHeight);
    
    CGFloat lblTextX = imgvX + imgvWidth+ padding;
    CGFloat lblTextY = imgvY + lblTitleHeight + padding;
    CGFloat lblTextWidth = lblTitleWidth;
    CGSize  sizeText = [self sizeWithString:model.desc font:[UIFont systemFontOfSize:14] maxSize:CGSizeMake(lblTextWidth, MAXFLOAT)];
    CGFloat lblTextHeight = sizeText.height;
    self.lblTExtFrame = CGRectMake(lblTextX, lblTextY, lblTextWidth, lblTextHeight);
    
    CGFloat lblDateX = kScreenWidth - 140;
    CGFloat lblDateY = lblTextY + lblTextHeight + padding;
    CGFloat lblDateWidth = 140;
    CGFloat lblDateHeight = 30;
    self.lblDataFrame = CGRectMake(lblDateX, lblDateY, lblDateWidth, lblDateHeight);
    
    CGFloat cellHeight = 0;
    cellHeight = lblTextY + lblTextHeight + padding;
//    NSLog(@"%f",cellHeight );
    if (cellHeight <= 90) {
        self.cellHeight = 90 + padding;
    }else
    {
        self.cellHeight = cellHeight;
    }
    
}
/**
   *  计算文本的宽高
   *
   *  @param str     需要计算的文本
   *  @param font    文本显示的字体
   *  @param maxSize 文本显示的范围
   *
   *  @return 文本占用的真实宽高
   */
- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *dict = @{NSFontAttributeName : font
                           
                           };
    // 如果将来计算的文字的范围超出了指定的范围,返回的就是指定的范围
    // 如果将来计算的文字的范围小于指定的范围, 返回的就是真实的范围
    CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dict context:nil].size;
    return size;
}
@end
