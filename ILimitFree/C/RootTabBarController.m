//
//  RootTabBarController.m
//  ILimitFree
//
//  Created by qf on 15/5/15.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import "RootTabBarController.h"
#import "LimitFreeViewController.h"
#import "SubjectViewController.h"
#import "FreeViewController.h"
#import "HotRankViewController.h"
#import "ReducePriceViewController.h"
@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
#pragma mark -- 限免
    LimitFreeViewController *limitFreeVC = [[LimitFreeViewController alloc] initWithNibName:@"LimitFreeViewController" bundle:nil];
    UINavigationController *limitFreeNav = [[UINavigationController alloc] initWithRootViewController:limitFreeVC];
    [limitFreeVC release];
    
    limitFreeNav.tabBarItem.title =@"限免";
    //设置images
    limitFreeNav.tabBarItem.image = [UIImage imageNamed:@"tabbar_limitfree.png"];
    limitFreeNav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_limitfree_press.png"];
    
    
#pragma mark -- 降价
    ReducePriceViewController *reducePriceVC = [[ReducePriceViewController alloc] initWithNibName:@"ReducePriceViewController" bundle:nil];
    UINavigationController *reducePriceNav = [[UINavigationController alloc] initWithRootViewController:reducePriceVC];
    [reducePriceVC release];
    reducePriceNav.tabBarItem.title =@"降价";
    //设置images
    reducePriceNav.tabBarItem.image = [UIImage imageNamed:@"tabbar_reduceprice.png"];
    reducePriceNav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_reduceprice_press"];
    
    
#pragma mark -- 免费
    FreeViewController *freeVC = [[FreeViewController alloc] initWithNibName:@"FreeViewController" bundle:nil];
    UINavigationController *freeNav = [[UINavigationController alloc] initWithRootViewController:freeVC];
    [freeVC release];
    freeNav.tabBarItem.title =@"免费";
    //设置images
    freeNav.tabBarItem.image = [UIImage imageNamed:@"tabbar_appfree"];
    freeNav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_appfree_press"];
    
    
    
#pragma mark -- 专题
    SubjectViewController *subjectVC = [[SubjectViewController alloc] initWithNibName:@"SubjectViewController" bundle:nil];
    UINavigationController *subjectNav = [[UINavigationController alloc] initWithRootViewController:subjectVC];
    [subjectVC release];
    subjectNav.tabBarItem.title =@"专题";
    //设置images
    subjectNav.tabBarItem.image = [UIImage imageNamed:@"tabbar_subject"];
    subjectNav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_subject_press"];
    
                                
                                
    
    
#pragma mark -- 热榜
    HotRankViewController *hotRankVC = [[HotRankViewController alloc] initWithNibName:@"HotRankViewController" bundle:nil];
    UINavigationController *hotRankNav = [[UINavigationController alloc] initWithRootViewController:hotRankVC];
    [hotRankVC release];
    hotRankNav.tabBarItem.title =@"热榜";
    //设置images
    hotRankNav.tabBarItem.image = [UIImage imageNamed:@"tabbar_rank"];
    hotRankNav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_rank_press"];
    
    
    
    
//设置viewControllers
    self.viewControllers = @[limitFreeNav,reducePriceNav,freeNav,subjectNav,hotRankNav];
    [limitFreeNav release];
    [reducePriceNav release];
    [freeNav release];
    [subjectNav release];
    [hotRankNav release];
    
  //
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:242/255.0 green:40/255.0 blue:29/255.0 alpha:0.5]];
    [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
