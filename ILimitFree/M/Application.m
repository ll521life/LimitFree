//
//  Application.m
//  ILimitFree
//
//  Created by qf on 15/5/15.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import "Application.h"

@implementation Application
//字典中有key，但数据模型中没有对应的key属性，这种情况会调用下面的方法，可处理一些特殊情况
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"description"]) {
        _des = [value retain];
       
    }
   //  NSLog(@"key:%@",key);
    
}
//防止别人利用kvc读取数据模型属性，当属性不存在时，如果不重写下面的方法，程序会崩溃。
- (id)valueForUndefinedKey:(NSString *)key{
    return nil;
}
- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        //将所所有的属性赋值
        [self setValuesForKeysWithDictionary:dic];
        
        
//        _applicationId = [dic[@"applicationId"]copy];
//        _slug = [dic[@"slug"]copy];
//        _name = [dic[@"name"]copy];
//        _releaseDate = [dic[@"_releaseDate"]copy];
//        _version = [dic[@""]]
//        des;
//        categoryId;
//        categoryName;
//        iconUrl;
//        itunesUrl;
//        starCurrent;
//        starOverall;
//        ratingOverall;
//        downloads;
//        currentPrice;
//        lastPrice;
//        priceTrend;
//        expireDatetime;
//        releaseNotes;
//        updateDate;
//        fileSize;
//        ipa;
//        shares;
//        favorites;
        
    }
    return self;
}
+ (Application *)applicationWithDic:(NSDictionary *)dic{
    Application *application = [[[Application alloc] initWithDic:dic]autorelease];
    return application;
}
+ (id)gameWithDic:(NSDictionary *)dic {
    
    Application *app = [[Application alloc] initWithDic:dic];
    
    return app;
}
//- (NSString *)description {
//    
//    NSString *str = [[NSString alloc]
//                     initWithFormat:@"applicationId:%@\nslug:%@\nname:%@\nreleaseDate:%@"
//                     @"\nversion:%@\ndescription:%@\ncategoryId:%@"
//                     @"\ncategoryName:%@\niconUrl:%@\nitunesUrl:%@"
//                     @"\nstarCurrent:%@\nstarOverall:%@\nratingOverall:%@"
//                     @"\ndownloads:%@\ncurrentPrice:%@\nlastPrice:%@"
//                     @"\npriceTrend:%@\nexpireDatetime:%@\nupdateDate:%@"
//                     @"\nreleaseNotes:%@\nfileSize:%@\nipa:%@\nshares:%@"
//                     @"\nfavorites:%@\n",
//                     self.applicationId, self.slug, self.name, self.releaseDate,
//                     self.version, self.des, self.categoryId, self.categoryName,
//                     self.iconUrl, self.itunesUrl, self.starCurrent,
//                     self.starOverall, self.ratingOverall, self.downloads,
//                     self.currentPrice, self.lastPrice, self.priceTrend,
//                     self.expireDatetime, self.updateDate, self.releaseNotes,
//                     self.fileSize, self.ipa, self.shares, self.favorites];
//    
//    return str;
//}
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
