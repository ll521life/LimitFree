//
//  Game.h
//  ILimitFree
//
//  Created by qf on 15/5/21.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject
@property (nonatomic, copy) NSString *applicationId;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *iconUrl;

@property (nonatomic, copy) NSString *starOverall;

@property (nonatomic, copy) NSString *downloads;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *ratingOverall;
- (instancetype)initWithDic:(NSDictionary *)dic;
+ (Game *)gameWithDic:(NSDictionary *)dic;
@end
