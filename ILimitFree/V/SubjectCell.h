//
//  SubjectCell.h
//  ILimitFree
//
//  Created by qf on 15/5/21.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Subject;
@interface SubjectCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>
@property (retain, nonatomic) IBOutlet UILabel *titleLabel;
@property (retain, nonatomic) IBOutlet UIImageView *bigImageView;
@property (retain, nonatomic) IBOutlet UIImageView *smallImageView;
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) IBOutlet UILabel *descLabel;
//存储当前cell的数据模型
@property (retain, nonatomic) Subject *subject;
- (void) refreshCell:(Subject *)subject;
@end
