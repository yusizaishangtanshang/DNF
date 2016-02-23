//
//  NewsTableViewCell.m
//  DNF
//
//  Created by 贺东方 on 16/1/25.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#import "NewsTableViewCell.h"
#import <UIImageView+AFNetworking.h>
@implementation NewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configUI];
        self.backgroundColor = color(250, 247, 226);
//        R:255 G:255 B:0
        
    }
    return self;
}

- (void)configUI
{
    //图片
    UIImageView *image = [[UIImageView alloc]init];
    [self.contentView addSubview:image];
    self.imgv = image;
    
    //标题
    UILabel *lblTitle = [[UILabel alloc]init];
    lblTitle.lineBreakMode = NSLineBreakByTruncatingTail ;
    lblTitle.numberOfLines = 1;
    lblTitle.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:lblTitle];
    self.LblTitle = lblTitle;
//    lblTitle.backgroundColor = [UIColor greenColor];

    //描述
    UILabel *lblText = [[UILabel alloc]init];
    lblText.lineBreakMode = NSLineBreakByTruncatingTail ;
    lblText.numberOfLines = 0;
    lblText.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:lblText];
//    lblText.backgroundColor = [UIColor greenColor];
    self.LblText = lblText;
    
    //日期
    UILabel *lblDate = [[UILabel alloc]init];
    lblDate.font = [UIFont systemFontOfSize:14];
//    lblDate.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:lblDate];
    self.LblDate = lblDate;
    
    
    
//    NSLog(@"%f",self.bounds.size.height );
}

- (void)setCellFrame:(NewsTableViewCellFrame *)cellFrame
{
    [self settingFrameWithCellFrame:cellFrame];
    [self fillDataForUIWithCellFrame:cellFrame];
}

- (void)settingFrameWithCellFrame:(NewsTableViewCellFrame *)cellFrame
{
    _cellFrame = cellFrame;
    self.LblText.frame = _cellFrame.lblTExtFrame;
    self.LblDate.frame = _cellFrame.lblDataFrame;
    self.imgv.frame = _cellFrame.imgvFrame;
    self.LblTitle.frame = _cellFrame.lblTitleFrame;
}

- (void)fillDataForUIWithCellFrame:(NewsTableViewCellFrame *)cellFrame {
    self.LblText.text =cellFrame.model.desc;
    self.LblTitle.text = cellFrame.model.title;
//    NSNumber *number = cellFrame.model.published;
//    NSLog(@"%@", [NSDate dateWithTimeIntervalSinceReferenceDate:[number doubleValue]]);

    //    self.LblDate.text = cellFrame.model.desc;
    if (![cellFrame.model.pic_url isEqualToString:@""]) {
        self.imgv.hidden = NO;
        [self.imgv setImageWithURL:[NSURL URLWithString:cellFrame.model.pic_url]];
    }
    else
    {
        self.imgv.hidden = YES;
        
    }
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
