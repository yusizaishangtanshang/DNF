//
//  DockItem.m
//  Dock
//
//  Created by 贺东方 on 15/8/3.
//  Copyright (c) 2015年 贺东方. All rights reserved.
//

#import "DockItem.h"

@implementation DockItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        // 2.文字大小
        self.titleLabel.font = [UIFont systemFontOfSize:20];
        
        // 3.图片的内容模式
        self.imageView.contentMode = UIViewContentModeCenter;
        
        // 4.设置选中时的背景
        //        [self setBackgroundImage:[UIImage imageNamed:kDockItemSelectedBG] forState:UIControlStateSelected];
        // 5.设置背景颜色
        self.backgroundColor = color(42, 41, 39);
    }
    return self;
}

//- (void)setSelected:(BOOL)selected
//{
//    [super setSelected:selected];
//    self.backgroundColor = [UIColor blackColor];
//}

#pragma mark 覆盖父类在highlighted时的所有操作
- (void)setHighlighted:(BOOL)highlighted {
    //    [super setHighlighted:highlighted];
}

#pragma mark 调整内部ImageView的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height);
}

#pragma mark 调整内部UILabel的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 10, contentRect.size.width - 5, 20);
}


@end
