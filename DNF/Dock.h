//
//  Dock.h
//  Dock
//
//  Created by 贺东方 on 15/8/3.
//  Copyright (c) 2015年 贺东方. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Dock;
@protocol DockDelegate <NSObject>


- (void)dock:(Dock *)dock itemSelectedFrom:(int)from to:(int)to;

@end




@interface Dock : UIView
/**
 *  Dock's delegateßß
 */
@property(nonatomic,weak)id<DockDelegate>delegate;

/**
 *  Dock's backgroundView
 */
@property (nonatomic,copy)NSString *backgroundView;

- (void)addItemWithTitle:(NSString *)title NormalImage:(UIImage *)normalImage SelectedImage:(UIImage *)selectedImage;
@end
