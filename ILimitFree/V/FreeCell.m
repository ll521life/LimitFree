//
//  FreeCell.m
//  ILimitFree
//
//  Created by qianfeng on 15/5/25.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import "FreeCell.h"
#import "Free.h"
#import "UIImageView+WebCache.h"
@interface FreeCell()

@property (nonatomic, copy) UIImageView *iconImageView;
@property (nonatomic, copy) UILabel *gameNameLabel;
@property (nonatomic, copy) UILabel *grade;
@property (nonatomic, copy) UILabel *money;
@property (nonatomic, copy) UIView *view;
@property (nonatomic, copy) UIImageView *star1;
@property (nonatomic, copy) UIImageView *star2;
@property (nonatomic, copy) UIImageView *star3;
@property (nonatomic, copy) UIImageView *star4;
@property (nonatomic, copy) UIImageView *star5;
@property (nonatomic, copy) UILabel *type;
@property (nonatomic, copy) UILabel *bottomlabel;
@property (nonatomic, copy) UIImageView *point;

@end
@implementation FreeCell
- (void)awakeFromNib {
    // Initialization code
    _iconImageView = [[UIImageView alloc] init];
    _bottomlabel = [[UILabel alloc] init];
    _gameNameLabel = [[UILabel alloc] init];
    _grade = [[UILabel alloc] init];
    _money = [[UILabel alloc] init];
    _view = [[UIView alloc] init];
    _star1 = [[UIImageView alloc] init];
    _star2 = [[UIImageView alloc] init];
    _star3 = [[UIImageView alloc] init];
    _star4 = [[UIImageView alloc] init];
    _star5 = [[UIImageView alloc] init];
    _type = [[UILabel alloc] init];
    _point = [[UIImageView alloc] init];
    [self addSubview:_iconImageView];
    [self addSubview:_bottomlabel];
    [self addSubview:_gameNameLabel];
    [self addSubview:_grade];
    [self addSubview:_money];
    [self addSubview:_view];
    [self addSubview:_type];
    [self addSubview:_point];
    [_view addSubview:_star1];
    [_view addSubview:_star2];
    [_view addSubview:_star3];
    [_view addSubview:_star4];
    [_view addSubview:_star5];
    //icon
    [_iconImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(10);
        make.left.equalTo(self.left).offset(15);
        make.right.equalTo(_gameNameLabel.left).offset(-10);
        // make.bottom.equalTo(self.bottom).offset(-10);
        make.width.equalTo(@(67));
        make.height.equalTo(@(67));
        
    }];
    //gameName
    [_gameNameLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(5);
        make.left.equalTo(_iconImageView.right).offset(10);
    }];
    //评分
    [_grade makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_gameNameLabel.bottom).offset(2);
        make.left.equalTo(_iconImageView.right).offset(10);
    }];
    //价格
    [_money makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(30);
        make.left.equalTo(_iconImageView.right).offset(170);
    }];
    //右边的箭头
    [_point makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(40);
        make.right.equalTo(self.right).offset(-20);
        make.bottom.equalTo(self.bottom).offset(-55);
    }];
    //星星subView
    [_view makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_grade.bottom).offset(2);
        make.left.equalTo(_iconImageView.right).offset(10);
        
    }];
    //星星
    //1
    
    [_star1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view.top).offset(0);
        make.bottom.equalTo(_view.bottom).offset(0);
        make.left.equalTo(_view.left).offset(0);
        make.width.equalTo(_star2);
        make.height.equalTo(_star2);
        make.right.equalTo(_star2.left).offset(0);
    }];
    
    [_star2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view.top).offset(0);
        make.bottom.equalTo(_view.bottom).offset(0);
        make.left.equalTo(_star1.right).offset(0);
        make.width.equalTo(_star3);
        make.height.equalTo(_star3);
        make.right.equalTo(_star3.left).offset(0);
    }];
    
    [_star3 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view.top).offset(0);
        make.bottom.equalTo(_view.bottom).offset(0);
        make.left.equalTo(_star2.right).offset(0);
        make.width.equalTo(_star4);
        make.height.equalTo(_star4);
        make.right.equalTo(_star4.left).offset(0);
    }];
    
    [_star4 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view.top).offset(0);
        make.bottom.equalTo(_view.bottom).offset(0);
        make.left.equalTo(_star3.right).offset(0);
        make.width.equalTo(_star5);
        make.height.equalTo(_star5);
        make.right.equalTo(_star5.left).offset(0);
    }];
    
    [_star5 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view.top).offset(0);
        make.bottom.equalTo(_view.bottom).offset(0);
        make.left.equalTo(_star4.right).offset(0);
    }];
    //底部分享label
    [_bottomlabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(15);
        make.bottom.equalTo(self.bottom).offset(-5);
    }];
    //
    [_type makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_money.bottom).offset(2);
        make.left.equalTo(_iconImageView.right).offset(175);
    }];

    
}
- (void)refreshCell:(Free *)free andIndex:(NSInteger)index{
    NSURL *iconUrl = [NSURL URLWithString:free.iconUrl];
    [_iconImageView setImageWithURL:iconUrl placeholderImage:[UIImage imageNamed:@"Defaultretein7"]];
    _gameNameLabel.text = [NSString stringWithFormat:@"%ld.%@",index+1,free.name];
    _grade.text = [NSString stringWithFormat:@"评分:%@分",free.starCurrent];
    _grade.textColor = [UIColor lightGrayColor];
    _money.text = @"￥0.0";
    _money.textColor = [UIColor lightGrayColor];
    _point.image = [UIImage imageNamed:@"appproduct_indicator.png"];
    //星星
    NSArray *array = @[_star1,_star2,_star3,_star4,_star5];
    for (NSInteger i = 0; i < 5; i++) {
        UIImageView *imageView = array[i];
        if (i < [free.starCurrent integerValue]) {
            imageView.image = [UIImage imageNamed:@"appproduct_starforeground_Topic"];
        }else{
            imageView.image = [UIImage imageNamed:@"appproduct_starbackground_Topic"];
        }
        
    }
    if ([free.starCurrent integerValue]<[free.starCurrent floatValue]) {
        UIImageView *imageView = array[[free.starCurrent integerValue]];
        imageView.image = [UIImage imageNamed:@"appproduct_starforeground_half_Topic"];
    }
    //底部的label
    _bottomlabel.text = [NSString stringWithFormat:@"分享：%@次 收藏：%@ 下载：%@次",free.shares,free.favorites,free.downloads];
    _bottomlabel.textColor = [UIColor lightGrayColor];
    
    _type.text = @"游戏";
    _type.textColor = [UIColor lightGrayColor];

    
}

- (void)dealloc{
    [_iconImageView release];
    [_gameNameLabel release];
    [_grade release];
    [_money release];
    [_view release];
    [_star1 release];
    [_star2 release];
    [_star3 release];
    [_star4 release];
    [_star5 release];
    [_type release];
    [_bottomlabel release];
    [_point release];
    [super dealloc];
}
@end
