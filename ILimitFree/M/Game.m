//
//  Game.m
//  ILimitFree
//
//  Created by qf on 15/5/21.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import "Game.h"

@implementation Game
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
- (id)valueForUndefinedKey:(NSString *)key{
    return nil;
}
- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (Game *)gameWithDic:(NSDictionary *)dic{
    Game *game = [[[Game alloc] initWithDic:dic]autorelease];
    return game;
}
- (void)dealloc{
    [_name release];
    [_comment release];
    [_iconUrl release];
    [_downloads release];
    [_applicationId release];
    [_starOverall release];
    [_ratingOverall release];
    [super dealloc];
}
@end
