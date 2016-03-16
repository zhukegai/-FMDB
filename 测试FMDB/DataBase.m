//
//  DataBase.m
//  测试FMDB
//
//  Created by beike柯 on 16/3/16.
//  Copyright © 2016年 beike柯. All rights reserved.
//

#import "DataBase.h"
#import "FMDatabase.h"

@interface DataBase()
@property(nonatomic,strong)FMDatabase* db;

@end

@implementation DataBase
static DataBase* db;

+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        db = [[DataBase alloc] init];
    });
    return db;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        db = [super allocWithZone:zone];
    });
    return db;
}

- (instancetype)init{
    if(self = [super init]){
        NSString* path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"db.sqlist"];
        _db = [[FMDatabase alloc] initWithPath:path];
        if(![_db open]){
            NSLog(@"打开数据库失败");
            return nil;
        }
    }
    return self;
}

- (void)createTable{
    NSString* recentSite = @"CREATE TABLE recentSiteList (id text, Age integer, Sex integer, Phone text, Address text, Photo blob);";
}

@end
