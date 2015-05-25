//
//  DownLoadData.m
//  007AFN的使用
//
//  Created by qf on 15/5/18.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import "DownLoadData.h"
#import "Application.h"
#import "AFAppDotNetAPIClient.h"
#import "Subject.h"
#import "ReducePrice.h"
#import "Free.h"
@implementation DownLoadData
#pragma mark--限免下载数据
+ (NSURLSessionDataTask *)getLimitFreeDataWithBlock:(void (^)(NSArray *posts, NSError *error))block {
    
    return [[AFAppDotNetAPIClient sharedClient] GET:@"free/applications/limited?currency=rmb&page=1" parameters:nil success:^(NSURLSessionDataTask * __unused task, NSDictionary *JSON) {
        
        NSMutableArray *mutableArray = [NSMutableArray array];
        
        NSArray *apps = JSON[@"applications"];
        
        [apps enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            
            Application *app = [Application gameWithDic:obj];
            
            [mutableArray addObject:app];
            
        }];
        if (block) {
            block([NSArray arrayWithArray:mutableArray], nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block([NSArray array], error);
        }
    }];
}

#pragma mark--专题下载数据
+ (NSURLSessionDataTask *)getSubjectDataWithBlock:(void (^)(NSArray *subjects, NSError *error))block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"free/special?page=1&limit=5" parameters:nil success:^(NSURLSessionDataTask *task, NSArray *JSON) {
        //遍历数组创建subject对象并且存储到临时的数组。
        NSMutableArray *subjects = [@[]mutableCopy];
        [JSON enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            Subject *subject = [Subject subjectWithSubjectData:obj];
            //添加到数组
            [subjects addObject:subject];
        }];
        //调用block
        if (block) {
            //数据下载成功回调
            block(subjects,nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //数据下载失败回调
        block(nil,error);
    }];
}
#pragma mark--降价下载数据
+ (NSURLSessionDataTask *)getReducePriceDataWithBlock:(void (^)(NSArray *reducePirce, NSError *error))block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"free/applications/sales?currency=rmb&page=1" parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *JSON) {
        NSMutableArray *reducePrices = [@[]mutableCopy];
        NSArray * array = JSON[@"applications"];
        [array enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            ReducePrice *reducePrice = [ReducePrice reducePriceWithDic:obj];
            [reducePrices addObject:reducePrice];
        }];
        if (block) {
            block(reducePrices,nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //数据下载失败回调
        block(nil,error);
    }];
}
#pragma mark--免费下载数据

+ (NSURLSessionDataTask *)getFreeDataWithBlock:(void (^)(NSArray *free, NSError *error))block{
    return [[AFAppDotNetAPIClient sharedClient] GET:@"free/applications/free?currency=rmb&page=1" parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *JSON) {
        NSMutableArray *frees = [@[]mutableCopy];
        NSArray * array = JSON[@"applications"];
        [array enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            Free *free = [Free freeWithDic:obj];
            [frees addObject:free];
        }];
        if (block) {
            block(frees,nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //数据下载失败回调
        block(nil,error);
    }];
}



@end
