//
//  FreeCell.h
//  ILimitFree
//
//  Created by qianfeng on 15/5/25.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Free;
@interface FreeCell : UITableViewCell
- (void)refreshCell:(Free *)free andIndex:(NSInteger)index;
@end
