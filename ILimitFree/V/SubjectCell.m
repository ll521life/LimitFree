//
//  SubjectCell.m
//  ILimitFree
//
//  Created by qf on 15/5/21.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import "SubjectCell.h"
#import "Subject.h"
#import "UIImageView+WebCache.h"
#import "GameCell.h"
@implementation SubjectCell

//cell刷新
- (void)refreshCell:(Subject *)subject{
    _titleLabel.text = subject.title;
    NSURL *bigImageurl = [NSURL URLWithString:subject.img];
    [_bigImageView setImageWithURL:bigImageurl placeholderImage:[UIImage imageNamed:@"Default5"]];
    
    NSURL *smallImageurl = [NSURL URLWithString:subject.desc_img];
    [_smallImageView setImageWithURL:smallImageurl placeholderImage:[UIImage imageNamed:@"Default5"]];
    
    _descLabel.text = subject.desc;
    //通过set方法给subject赋值
    [self setSubject:subject];
    [_tableView reloadData];
    
}

- (void)awakeFromNib {
    // Initialization code
    //自适应大小
    _descLabel.adjustsFontSizeToFitWidth = YES;
    
    //给tableView设置数据源和代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //
    UINib *nibName = [UINib nibWithNibName:@"GameCell" bundle:nil];
    [_tableView registerNib:nibName forCellReuseIdentifier:@"GameCell"];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark--UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _subject.apps.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GameCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GameCell"];
    Game *game = _subject.apps[indexPath.row];
    [cell refreshCell:game];
    return cell;
}


#pragma mark--UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //cell的高度为tableView的1/4
    return _tableView.bounds.size.height/_subject.apps.count;
}


- (void)dealloc {
    [_titleLabel release];
    [_bigImageView release];
    [_smallImageView release];
    [_tableView release];
    [_descLabel release];
    [_subject release];
    [super dealloc];
}
@end
