//
//  Subject.h
//  ILimitFree
//
//  Created by qf on 15/5/21.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Subject : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *date;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *desc_img;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, retain) NSMutableArray *apps;

- (instancetype)initWithSubjectData:(NSDictionary *)dic;

+ (Subject *)subjectWithSubjectData:(NSDictionary *)dic;
@end
