//
//  ReducePriceCell.m
//  ILimitFree
//
//  Created by qf on 15/5/22.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import "ReducePriceCell.h"
#import "ReducePrice.h"
#import "UIImageView+WebCache.h"
@interface ReducePriceCell()
@property (nonatomic, copy) UIImageView *iconImageView;
@property (nonatomic, copy) UILabel *gameNameLabel;
@property (nonatomic, copy) UILabel *cureenPriceLabel;
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
@property (nonatomic, copy) UIImageView *line;
@end

@implementation ReducePriceCell

- (void)awakeFromNib {
    // Initialization code
    _iconImageView = [[UIImageView alloc] init];
    _bottomlabel = [[UILabel alloc] init];
    _gameNameLabel = [[UILabel alloc] init];
    _cureenPriceLabel = [[UILabel alloc] init];
    _money = [[UILabel alloc] init];
    _view = [[UIView alloc] init];
    _star1 = [[UIImageView alloc] init];
    _star2 = [[UIImageView alloc] init];
    _star3 = [[UIImageView alloc] init];
    _star4 = [[UIImageView alloc] init];
    _star5 = [[UIImageView alloc] init];
    _type = [[UILabel alloc] init];
    _point = [[UIImageView alloc] init];
    _line = [[UIImageView alloc] init];
    [self addSubview:_iconImageView];
    [self addSubview:_bottomlabel];
    [self addSubview:_gameNameLabel];
    [self addSubview:_cureenPriceLabel];
    [self addSubview:_money];
    [self addSubview:_view];
    [self addSubview:_type];
    [self addSubview:_point];
    [self addSubview:_line];
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
    //现价
    [_cureenPriceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_gameNameLabel.bottom).offset(2);
        make.left.equalTo(_iconImageView.right).offset(10);
    }];
    //原价
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
        make.top.equalTo(_cureenPriceLabel.bottom).offset(2);
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
    //line
    [_line makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_money.top).offset(3);
        make.left.equalTo(_money.left).offset(-2);
        make.width.equalTo(_money.width);
    }];
    
 
    
   }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)refreshCell:(ReducePrice *)reducePrice andIndex:(NSInteger)index{
//    [_iconImageView makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.top).offset(0);
//        make.left.equalTo(self.view.left).offset(0);
//        make.right.equalTo(self.view.right).offset(-10);
////        CGFloat height = _view.bounds.size.height;
////        make.width.equalTo(@(height*0.6));
//        make.bottom.equalTo(self.view.bottom).offset(-10);
//    }];
    NSURL *iconUrl = [NSURL URLWithString:reducePrice.iconUrl];
    [_iconImageView setImageWithURL:iconUrl placeholderImage:[UIImage imageNamed:@"Defaultretein7"]];
    _gameNameLabel.text = [NSString stringWithFormat:@"%ld.%@",index+1,reducePrice.name];
    _cureenPriceLabel.text = [NSString stringWithFormat:@"现价￥:%@.00",reducePrice.currentPrice];
    _cureenPriceLabel.textColor = [UIColor lightGrayColor];
    _money.text = [NSString stringWithFormat:@"￥%@.0",reducePrice.lastPrice];
    _money.textColor = [UIColor lightGrayColor];
    _point.image = [UIImage imageNamed:@"appproduct_indicator.png"];
    //星星
    NSArray *array = @[_star1,_star2,_star3,_star4,_star5];
    for (NSInteger i = 0; i < 5; i++) {
        UIImageView *imageView = array[i];
        if (i < [reducePrice.starCurrent integerValue]) {
            imageView.image = [UIImage imageNamed:@"appproduct_starforeground_Topic"];
        }else{
            imageView.image = [UIImage imageNamed:@"appproduct_starbackground_Topic"];
        }
        
    }
    if ([reducePrice.starCurrent integerValue]<[reducePrice.starCurrent floatValue]) {
        UIImageView *imageView = array[[reducePrice.starCurrent integerValue]];
        imageView.image = [UIImage imageNamed:@"appproduct_starforeground_half_Topic"];
    }
    //底部的label
    _bottomlabel.text = [NSString stringWithFormat:@"分享：%@次 收藏：%@ 下载：%@次",reducePrice.shares,reducePrice.favorites,reducePrice.downloads];
    _bottomlabel.textColor = [UIColor lightGrayColor];
    
    _type.text = @"游戏";
    _type.textColor = [UIColor lightGrayColor];
    _line.image = [UIImage imageNamed:@"appproduct_line.png"];
    

    
}
- (void)dealloc{
    [_iconImageView release];
    [_gameNameLabel release];
    [_cureenPriceLabel release];
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
    [_line release];
    [super dealloc];
}
@end
