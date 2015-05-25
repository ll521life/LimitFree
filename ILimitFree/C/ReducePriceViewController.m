//
//  ReducePriceViewController.m
//  ILimitFree
//
//  Created by qf on 15/5/15.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import "ReducePriceViewController.h"
#import "ReducePriceCell.h"

@interface ReducePriceViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}
@property (nonatomic, copy)NSMutableArray *reducePrices;
@property (nonatomic, copy)UITableView *tableView;
@end

@implementation ReducePriceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"降价";
    _reducePrices = [@[]mutableCopy];
    [DownLoadData getReducePriceDataWithBlock:^(NSArray *posts, NSError *error) {
        [_reducePrices addObjectsFromArray:posts];
        [_tableView reloadData];
    }];
#pragma mark--搭建UI
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NAVGATION_ADD_STATUSBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT-NAVGATION_ADD_STATUSBAR_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    UINib *nibName = [UINib nibWithNibName:@"ReducePriceCell" bundle:nil];
    [_tableView registerNib:nibName forCellReuseIdentifier:@"ReducePriceCell"];
}

- (void)dealloc{
    [_reducePrices release];
    [_tableView release];
    [super dealloc];
}
#pragma mark--UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _reducePrices.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"ReducePriceCell";
    ReducePriceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cellID) {
        cell = [[ReducePriceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    ReducePrice *app = _reducePrices[indexPath.row];
    [cell refreshCell:app andIndex:indexPath.row];
    return cell;
}

#pragma mark--UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (SCREEN_HEIGHT-TABBAR_HEIGHT-NAVGATION_ADD_STATUSBAR_HEIGHT)/5;
}
@end
