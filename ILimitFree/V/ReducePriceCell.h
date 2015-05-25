//
//  ReducePriceCell.h
//  ILimitFree
//
//  Created by qf on 15/5/22.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ReducePrice;
@interface ReducePriceCell : UITableViewCell
- (void)refreshCell:(ReducePrice *)reducePrice andIndex:(NSInteger)index;
@end
