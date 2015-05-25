//
//  ApplicationTableViewCell.h
//  ILimitFree
//
//  Created by qf on 15/5/15.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Application;
@interface ApplicationTableViewCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *iconImageView;
@property (retain, nonatomic) IBOutlet UILabel *gamesName;
@property (retain, nonatomic) IBOutlet UILabel *shengYu;
@property (retain, nonatomic) IBOutlet UILabel *money;
@property (retain, nonatomic) IBOutlet UILabel *type;
@property (retain, nonatomic) IBOutlet UIImageView *star1;
@property (retain, nonatomic) IBOutlet UIImageView *star2;
@property (retain, nonatomic) IBOutlet UIImageView *star3;
@property (retain, nonatomic) IBOutlet UIImageView *star4;
@property (retain, nonatomic) IBOutlet UIImageView *star5;
@property (retain, nonatomic) IBOutlet UILabel *share;
@property (retain, nonatomic) IBOutlet UILabel *shouCang;
@property (retain, nonatomic) IBOutlet UILabel *xiaZai;
- (void)refreshCell:(Application *)app andInteger:(NSInteger)index;
@end
