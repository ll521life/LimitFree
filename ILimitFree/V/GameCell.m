//
//  GameCell.m
//  ILimitFree
//
//  Created by qf on 15/5/21.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import "GameCell.h"
#import "Game.h"
#import "UIImageView+WebCache.h"
@implementation GameCell
- (void)refreshCell:(Game *)game{
    NSURL *iconUrl =[NSURL URLWithString:game.iconUrl];
    [_iconImageView setImageWithURL:iconUrl placeholderImage:[UIImage imageNamed:@"Defaultretein3"]];
    
    _gameNameLabel.text = game.name;
   // _gameNameLabel.adjustsFontSizeToFitWidth =YES;
    _commentLabel.text = game.comment.description;
    _commentLabel.adjustsFontSizeToFitWidth =YES;
    _downloadLabel.text = game.downloads;
    _downloadLabel.adjustsFontSizeToFitWidth =YES;
    NSArray *array = @[_star1,_star2,_star3,_star4,_star5];
    for (NSInteger i = 0; i < 5; i++) {
        UIImageView *imageView = array[i];
        if (i < [game.starOverall integerValue]) {
            imageView.image = [UIImage imageNamed:@"appproduct_starforeground_Topic"];
        }else{
            imageView.image = [UIImage imageNamed:@"appproduct_starbackground_Topic"];
        }
        
    }
    if ([game.starOverall integerValue]<[game.starOverall  floatValue]) {
        UIImageView *imageView = array[[game.starOverall  integerValue]];
        imageView.image = [UIImage imageNamed:@"appproduct_starforeground_half_Topic"];
    }

}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_iconImageView release];
    [_gameNameLabel release];
    [_commentLabel release];
    [_downloadLabel release];
    [_star1 release];
    [_star2 release];
    [_star3 release];
    [_star4 release];
    [_star5 release];
    [super dealloc];
}
@end
