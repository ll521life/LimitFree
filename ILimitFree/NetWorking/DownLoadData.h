//
//  DownLoadData.h
//  007AFN的使用
//
//  Created by qf on 15/5/18.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownLoadData : NSObject
#pragma mark--限免
+ (NSURLSessionDataTask *)getLimitFreeDataWithBlock:(void (^)(NSArray *posts, NSError *error))block;

#pragma mark--专题
+ (NSURLSessionDataTask *)getSubjectDataWithBlock:(void (^)(NSArray *posts, NSError *error))block;
#pragma mark--降价
+ (NSURLSessionDataTask *)getReducePriceDataWithBlock:(void (^)(NSArray *, NSError *))block;
#pragma mark--免费
+ (NSURLSessionDataTask *)getFreeDataWithBlock:(void (^)(NSArray *posts, NSError *error))block;

@end
