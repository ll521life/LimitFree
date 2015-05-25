//
//  Subject.m
//  ILimitFree
//
//  Created by qf on 15/5/21.
//  Copyright (c) 2015年 liang. All rights reserved.
//

#import "Subject.h"
#import "Game.h"
@implementation Subject
- (void)dealloc{
    [_title release];
    [_desc release];
    [_img release];
    [_desc_img release];
    [_apps release];
    [_date release];
    [super dealloc];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"applications"]) {
        NSArray *applications = value;
        //遍历数组创建Game对象
        
        [applications enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL *stop) {
            Game *game = [Game gameWithDic:dic];
            [_apps addObject:game];
        }];
    }
  //  NSLog(@"%@   %@",key,value);
}

- (id)valueForUndefinedKey:(NSString *)key{
    return nil;
}

- (instancetype)initWithSubjectData:(NSDictionary *)dic{
    if (self = [super init]) {
        //可变数组开辟空间
        _apps = [@[]mutableCopy];
        //通过kvc给属性赋值
        [self setValuesForKeysWithDictionary:dic];
        
    }
    return self;
}
+(Subject *)subjectWithSubjectData:(NSDictionary *)dic{
    Subject *subject = [[[Subject alloc] initWithSubjectData:dic]autorelease];
    return subject;
}
@end
