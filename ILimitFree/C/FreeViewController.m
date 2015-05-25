//
//  FreeViewController.m
//  ILimitFree
//
//  Created by qianfeng on 15/5/25.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import "FreeViewController.h"
#import "Free.h"
#import "FreeCell.h"
@interface FreeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy) UITableView *tableView;
@property (nonatomic, copy) NSMutableArray *freeArray;
@end

@implementation FreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    _freeArray = [@[]mutableCopy];
    [DownLoadData getFreeDataWithBlock:^(NSArray *posts, NSError *error) {
        [_freeArray addObjectsFromArray:posts];
        [_tableView reloadData];
    }];
#pragma mark--搭建UI
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NAVGATION_ADD_STATUSBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-TABBAR_HEIGHT-NAVGATION_ADD_STATUSBAR_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    UINib *nibName = [UINib nibWithNibName:@"FreeCell" bundle:nil];
    [_tableView registerNib:nibName forCellReuseIdentifier:@"FreeCell"];
    
}
- (void)dealloc{
    [_tableView release];
    [_freeArray release];
    [super dealloc];
}
#pragma mark--UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _freeArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"FreeCell";
    FreeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cellID) {
        cell = [[FreeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    Free *free = _freeArray[indexPath.row];
    [cell refreshCell:free andIndex:indexPath.row];
    return cell;
}

#pragma mark--UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (SCREEN_HEIGHT-TABBAR_HEIGHT-NAVGATION_ADD_STATUSBAR_HEIGHT)/5;
}
@end
