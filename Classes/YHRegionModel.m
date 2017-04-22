//
//  YHRegionModel.m
//  RegionDemo
//
//  Created by solot10 on 17/4/21.
//  Copyright © 2017年 solot10. All rights reserved.
//

#import "YHRegionModel.h"
#import "YHLanguageSetting.h"

@implementation YHRegionModel

- (BOOL)isEqual:(id)object
{
    YHRegionModel *model = (YHRegionModel *)object;
    if ([model.hasc isEqualToString:self.hasc]) {
        return YES;
    }
    return NO;
}

/// A replay subject saves the values it is sent (up to its defined capacity)
/// and resends those to new subscribers. It will also replay an error or
/// completion.
- (NSString *)currentName
{
    NSString *lang = [YHLanguageSetting currentLanguage];
    if ([lang hasPrefix:@"zh_Hans"]) {
        return self.cnName;
    } else if ([lang hasPrefix:self.lang]) {
        return self.localName;
    } else {
        return self.enName;
    }
    return nil;
}

- (NSString *)countryHasc
{
    NSString *country = [self.hasc substringToIndex:2];
    return country;
}

- (RegionLevel)level
{
    NSString *countryHasc = self.countryHasc;
    RegionLevel level = RegionLevelUnkonw;
    __block int length = 0;
    [[HQDBHelper queueWithClass:[self class]] inDatabase:^(FMDatabase *db) {
        NSString *sql = @"SELECT MAX(LENGTH(hasc)) FROM YHRegionModel WHERE hasc LIKE :hasc";
        FMResultSet *rs = [db executeQuery:sql withParameterDictionary:@{@"hasc" : [NSString stringWithFormat:@"%@%%", countryHasc]}];
        if ([rs next]) {
            length = [rs intForColumnIndex:0];
        }
    }];
    switch (length) {
        case 2: {
            level = RegionLevelOne;
        }
            break;
        case 5: {
            level = RegionLevelTwo;
        }
            break;
        case 8: {
            level = RegionLevelThree;
        }
            break;
        default:
            break;
    }
    return level;
}


/** 忽略字段列表*/
+ (nullable NSArray<NSString *> *)hq_propertyIgnoredList
{
    return @[@"level"];
}

/** 主键列表 */
+ (nullable NSArray<NSString *> *)hq_propertyPrimarykeyList
{
    return @[@"hasc"];
}

/** 所属库名称 该字段是生成数据库的必要字段*/
+ (nonnull NSString *)hq_dbName
{
    return @"region.db";
}

@end
