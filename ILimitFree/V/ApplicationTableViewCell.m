//
//  ApplicationTableViewCell.m
//  ILimitFree
//
//  Created by qf on 15/5/15.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import "ApplicationTableViewCell.h"
#import "Application.h"
@implementation ApplicationTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (void)refreshCell:(Application *)app andInteger:(NSInteger)index{
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:app.iconUrl]]];
   // [image drawInRect:CGRectMake(0, 0, 10, 10)];
    _iconImageView.image = image;
    
   // _iconImageView.frame = CGRectMake(0, 0, _iconImageView.bounds.size.width, _iconImageView.bounds.size.width);
    _gamesName.text = [NSString stringWithFormat:@"%ld.%@",index+1,app.name];
   // _gamesName.adjustsFontSizeToFitWidth = YES;
    _share.text = [NSString stringWithFormat:@"分享：%@次",app.shares];
    _share.adjustsFontSizeToFitWidth = YES;
    _share.textColor = [UIColor lightGrayColor];
    _shouCang.text = [NSString stringWithFormat:@"收藏：%@次",app.favorites];
    _shouCang.adjustsFontSizeToFitWidth = YES;
    _shouCang.textColor = [UIColor lightGrayColor];
    _xiaZai.text = [NSString stringWithFormat:@"下载：%@次",app.downloads];
    _xiaZai.adjustsFontSizeToFitWidth = YES;
    _xiaZai.textColor = [UIColor lightGrayColor];
    _money.text = [NSString stringWithFormat:@"￥%.f.0",[app.lastPrice floatValue]];
    _money.adjustsFontSizeToFitWidth = YES;
    _money.textColor = [UIColor lightGrayColor];
    _type.text = @"游戏";
    _type.adjustsFontSizeToFitWidth = YES;
    _type.textColor = [UIColor lightGrayColor];
    //剩余时间
    NSDateFormatter *date = [[NSDateFormatter alloc] init];
    //设置格式
    [date setDateFormat:@"YYYY-MM-dd HH:mm:ss.0"];
    //获取时间
    NSString *timeStr = [NSString stringWithFormat:@"%@",app.expireDatetime];
    NSDate *d = [date dateFromString:timeStr];
    
    NSTimeInterval late = [d timeIntervalSince1970]*1;
    NSDate *dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now = [dat timeIntervalSince1970]*1;
    NSString *timeString = @"";
    NSTimeInterval cha = late - now;
    int hours=((int)cha)%(3600*24)/3600;
    int minute=((int)cha)%(3600*24)/60%60;
    int miao=((int)cha)%(3600*24)%60;
    //小时
    if (hours >= 10) {
        timeString = [NSString stringWithFormat:@"剩余:%d:",hours];
    }else{
         timeString = [NSString stringWithFormat:@"剩余:0%d:",hours];
    }
    //分钟
    if (minute >= 10) {
        timeString = [NSString stringWithFormat:@"%@%d:",timeString,minute];
    }else{
        timeString = [NSString stringWithFormat:@"%@0%d:",timeString,minute];
    }
    
    //秒
    if (miao >= 10) {
        timeString = [NSString stringWithFormat:@"%@%d",timeString,miao];
    }else{
        timeString = [NSString stringWithFormat:@"%@0%d",timeString,miao];
    }
    
    
    _shengYu.text = timeString;
    _shengYu.adjustsFontSizeToFitWidth = YES;
    [date release];
    
    
    
    
    _shengYu.textColor = [UIColor lightGrayColor];
    NSArray *array = @[_star1,_star2,_star3,_star4,_star5];
    for (NSInteger i = 0; i < 5; i++) {
        UIImageView *imageView = array[i];
        if (i < [app.starCurrent integerValue]) {
            imageView.image = [UIImage imageNamed:@"appproduct_starforeground_Topic"];
        }else{
            imageView.image = [UIImage imageNamed:@"appproduct_starbackground_Topic"];
        }
        
    }
    if ([app.starCurrent integerValue]<[app.starCurrent floatValue]) {
        UIImageView *imageView = array[[app.starCurrent integerValue]];
        imageView.image = [UIImage imageNamed:@"appproduct_starforeground_half_Topic"];
    }
    
}

- (void)dealloc {
    [_iconImageView release];
    [_gamesName release];
    [_shengYu release];
    [_money release];
    [_type release];
    [_star1 release];
    [_star2 release];
    [_star3 release];
    [_star4 release];
    [_star5 release];
    [_share release];
    [_shouCang release];
    [_xiaZai release];
    [super dealloc];
}
@end
