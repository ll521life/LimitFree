//
//  SubjectViewController.m
//  ILimitFree
//
//  Created by qf on 15/5/15.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import "SubjectViewController.h"
#import "SubjectCell.h"
@interface SubjectViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
}
@property (nonatomic, copy)NSArray *subjects;
@end

@implementation SubjectViewController
- (void)dealloc{
    [_tableView release];
    [_subjects release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view from its nib.
    _subjects = [@[]mutableCopy];
    self.navigationItem.title = @"专题";
//异步下载数据
    [DownLoadData getSubjectDataWithBlock:^(NSArray *subjects, NSError *error) {
        self.subjects = subjects;
        //刷新tableView
        [_tableView reloadData];
        
    }];
//UI搭建
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NAVGATION_ADD_STATUSBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-NAVGATION_ADD_STATUSBAR_HEIGHT-TABBAR_HEIGHT) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
//注册cell
    UINib *nibName = [UINib nibWithNibName:@"SubjectCell" bundle:nil];
    [_tableView registerNib:nibName forCellReuseIdentifier:@"SubjectCell"];
    [self.view addSubview:_tableView];
    
}
#pragma mark--UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _subjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SubjectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubjectCell"];
    //从数组中取对象,
    Subject *subject = _subjects[indexPath.row];
    [cell refreshCell:subject];
    return cell;
}
#pragma mark--UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 400;
}
@end
