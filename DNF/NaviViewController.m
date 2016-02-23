//
//  NaviViewController.m
//  DNF
//
//  Created by 贺东方 on 16/2/23.
//  Copyright © 2016年 hexiaoyi. All rights reserved.
//

#import "NaviViewController.h"
#import "MenuTableViewController.h"
#import "UIViewController+REFrostedViewController.h"
#import "REFrostedViewController.h"

@interface NaviViewController ()
@property (strong, nonatomic) MenuTableViewController *menuViewController;

@end

@implementation NaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                             style:UIBarButtonItemStylePlain
                                                            target:(NaviViewController *)self.navigationController
                                                            action:@selector(showMenu)];
    self.navigationItem.leftBarButtonItem = item;

}
- (void)showMenu
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController presentMenuViewController];
}

#pragma mark -
#pragma mark Gesture recognizer

- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController panGestureRecognized:sender];
}

@end
