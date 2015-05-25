//
//  GameCell.h
//  ILimitFree
//
//  Created by qf on 15/5/21.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Game;
@interface GameCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *iconImageView;
@property (retain, nonatomic) IBOutlet UILabel *gameNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *commentLabel;

@property (retain, nonatomic) IBOutlet UILabel *downloadLabel;

@property (retain, nonatomic) IBOutlet UIImageView *star1;
@property (retain, nonatomic) IBOutlet UIImageView *star2;
@property (retain, nonatomic) IBOutlet UIImageView *star3;
@property (retain, nonatomic) IBOutlet UIImageView *star4;
@property (retain, nonatomic) IBOutlet UIImageView *star5;
- (void) refreshCell:(Game *)game;
@end
