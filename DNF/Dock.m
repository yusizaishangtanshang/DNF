//
//  Dock.m
//  Dock
//
//  Created by 贺东方 on 15/8/3.
//  Copyright (c) 2015年 贺东方. All rights reserved.
//

#import "Dock.h"
#import "DockItem.h"
@interface Dock()
@property (nonatomic)CGFloat itemWidth;
@property (nonatomic,assign)NSInteger itemCounts;
@end
@interface Dock ()
{
    DockItem *_selectedItem;
}
@end

@implementation Dock

- (void)setBackgroundView:(NSString *)backgroundView
{
    if (backgroundView) {
        self.backgroundView = backgroundView;
    }
}
- (void)addItemWithTitle:(NSString *)title NormalImage:(UIImage *)normalImage SelectedImage:(UIImage *)selectedImage;
{
    // 1.创建item
    DockItem *item = [[DockItem alloc] init];
    // 文字
    [item setTitle:title forState:UIControlStateNormal];
    [item setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    // 图标
    [item setImage:normal forState:UIControlStateNormal];
    [item setImage:selectedImage forState:UIControlStateSelected];
    // 监听item的点击
    [item addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchDown];
    
    
    
    // 2.添加item
    [self addSubview:item];
    NSInteger count = self.subviews.count;
    // 默认选中第一个item
    if (count == 1) {
        [self Click:item];
    }
    
    // 3.调整所有item的frame
    CGFloat height = self.frame.size.height; // 高度
    CGFloat width = self.frame.size.width / count; // 宽度
    for (int i = 0; i < count; i++) {
        DockItem *dockItem = self.subviews[i];
        dockItem.tag = i; // 绑定标记
        dockItem.frame = CGRectMake(width * i, 0, width, height);
//        NSLog(@"width =%f, tag = %ld",dockItem.frame.size.width,(long)dockItem.tag);
    }
}


- (void)Click:(DockItem *)item
{
    // 0.通知代理
    if ([_delegate respondsToSelector:@selector(dock:itemSelectedFrom:to:)]) {
        [_delegate dock:self itemSelectedFrom:_selectedItem.tag to:item.tag];
    }
    
    // 1.取消选中当前选中的item
    _selectedItem.selected = NO;
    
    // 2.选中点击的item
    item.selected = YES;
    
    // 3.赋值
    _selectedItem = item;
}


@end
