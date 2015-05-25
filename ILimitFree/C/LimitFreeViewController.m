//
//  LimitFreeViewController.m
//  ILimitFree
//
//  Created by qf on 15/5/15.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import "LimitFreeViewController.h"
#import "Application.h"
#import "ApplicationTableViewCell.h"
#import "ReducePriceViewController.h"
#import "DownLoadData.h"
@interface LimitFreeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_applications;
    UITableView *_tableView;
}
@end

@implementation LimitFreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"限免";
    self.automaticallyAdjustsScrollViewInsets = NO;
    _applications = [@[]mutableCopy];
   #pragma mark -- 下载数据
    [DownLoadData getLimitFreeDataWithBlock:^(NSArray *posts, NSError *error) {
        [_applications addObjectsFromArray:posts];
        [_tableView reloadData];
    }];

    //NSLog(@"%@",limitFreeContent);

#pragma mark -- 搭建UI
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 -44) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    _tableView =  [tableView retain];
    [self.view addSubview:_tableView];
    [tableView release];
    //注册cell
    UINib *nibName = [UINib nibWithNibName:@"ApplicationTableViewCell" bundle:nil];
    [_tableView registerNib:nibName forCellReuseIdentifier:@"ApplicationTableViewCell"];
    
    //添加手势
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [_tableView addGestureRecognizer:leftSwipe];
    [leftSwipe release];

    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _applications.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"ApplicationTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[ApplicationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];;
    }
    
   // cell.textLabel.text = @"123";
    //配置cell
    Application *app = _applications[indexPath.row];
    [(ApplicationTableViewCell*)cell refreshCell:app andInteger:indexPath.row];
    return cell;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELL_HEIGHT;
}
- (void)dealloc{
    [_applications release];
    [_tableView release];
    [super dealloc];
}

//轻扫手势
- (void)swipe:(UISwipeGestureRecognizer *)swipe{
    [self.tabBarController setSelectedIndex:1];
//    [UIView animateWithDuration:2 animations:^{
//
//    }];
}

@end
