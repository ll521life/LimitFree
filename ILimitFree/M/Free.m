//
//  Free.m
//  ILimitFree
//
//  Created by qianfeng on 15/5/25.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import "Free.h"

@implementation Free
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"description"]) {
        _des = [value retain];
    }
}
//未定义key
- (id)valueForUndefinedKey:(NSString *)key{
    return nil;
}
- (instancetype)initWithDic:(NSDictionary *)Dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:Dic];
    }
    return self;
}
+ (Free *)freeWithDic:(NSDictionary *)Dic{
    Free *free = [[[Free alloc] initWithDic:Dic]autorelease];
    return  free;
}
- (void)dealloc{
    [_applicationId release];
    [_slug release];
    [_name release];
    [_releaseDate release];
    [_version release];
    [_des release];
    [_categoryId release];
    [_categoryName release];
    [_iconUrl release];
    [_itunesUrl release];
    [_starCurrent release];
    [_starOverall release];
    [_ratingOverall release];
    [_downloads release];
    [_currentPrice release];
    [_lastPrice release];
    [_priceTrend release];
    [_expireDatetime release];
    [_releaseNotes release];
    [_updateDate release];
    [_fileSize release];
    [_ipa release];
    [_shares release];
    [_favorites release];
    [super dealloc];
}

@end
