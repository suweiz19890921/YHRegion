//
//  YHRegionManager.m
//  RegionDemo
//
//  Created by solot10 on 17/4/21.
//  Copyright © 2017年 solot10. All rights reserved.
//

#import "YHRegionManager.h"
#define REGION_DATA_HAS_COPIED_KEY [NSString stringWithFormat:@"%@", @"RegionDataHasCopied"]
@implementation YHRegionManager

+ (void)load
{
    BOOL hasCopied = [[NSUserDefaults standardUserDefaults] boolForKey:REGION_DATA_HAS_COPIED_KEY];
    if (!hasCopied) {
        NSString *bundlePath = [[[NSBundle bundleForClass:[self class]] resourcePath] stringByAppendingPathComponent:@"regionDb.bundle"];
        NSString *src = [[NSBundle bundleWithPath:bundlePath] pathForResource:@"region" ofType:@"db"];
        NSString *des = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"region.db"];
        NSFileManager *manager = [NSFileManager defaultManager];
        if ([manager fileExistsAtPath:src]) {
            NSError *error = nil;
            [manager copyItemAtPath:src toPath:des error:&error];
        }
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:REGION_DATA_HAS_COPIED_KEY];
    }
}

+ (YHRegionModel *)modelForHasc:(NSString *)hasc
{
    YHRegionModel *model = [[YHRegionModel hq_selectByColumns:@{@"hasc" : hasc}] firstObject];
    return model;
}

//获取所有的国家
+ (NSArray<YHRegionModel *> *)allCountrys
{
    NSArray *arr = [[YHRegionModel hq_selectByWHERE:@"LENGTH(hasc) = :length" withDictionary:@{@"length" : @(2)}] copy];
    return arr;
}

//获取指定hasc下属的所有地区
+ (NSArray<YHRegionModel *> *)subRegionByHasc:(NSString *)hasc
{
    NSArray *arr = [YHRegionModel hq_selectBySQL:@"select * from YHRegionModel where hasc LIKE :hasc and length(hasc) = :len" withDictionary:@{@"hasc" : [NSString stringWithFormat:@"%@%%", [hasc lowercaseString]], @"len" : @(hasc.length + 3)}];
    return arr;
}

//
+ (NSString *)fullNameByHasc:(NSString *)hasc;
{
    if (![self _checkHascVaild:hasc]) return nil;
    
    NSString *c = [hasc substringToIndex:2];
    NSString *seperator = nil;
    BOOL asc;
    if ([c isEqualToString:@"CN"]) {
        seperator = @"·";
        asc = YES;
    } else {
        seperator = @",";
        asc = NO;
    }
    return [self _fullNameByHasc:hasc seperator:seperator asc:asc];
}

+ (NSString *)fullNameByHasc:(NSString *)hasc seperator:(NSString *)seperator;
{
    if (![self _checkHascVaild:hasc]) return nil;
    
    NSString *c = [hasc substringToIndex:2];
    BOOL asc;
    if ([c isEqualToString:@"CN"]) {
        asc = YES;
    } else {
        asc = NO;
    }
    return [self _fullNameByHasc:hasc seperator:seperator asc:asc];
}

+ (NSString *)fullNameByHasc:(NSString *)hasc asc:(BOOL)asc;
{
    if (![self _checkHascVaild:hasc]) return nil;
    
    NSString *c = [hasc substringToIndex:2];
    NSString *seperator = nil;
    if ([c isEqualToString:@"CN"]) {
        seperator = @"·";
    } else {
        seperator = @",";
    }
    return [self _fullNameByHasc:hasc seperator:seperator asc:asc];
}

+ (NSString *)fullNameByHasc:(NSString *)hasc seperator:(NSString *)seperator asc:(BOOL)asc;
{
    if (![self _checkHascVaild:hasc]) return nil;
    return [self _fullNameByHasc:hasc seperator:seperator asc:asc];
}

//
+ (NSString *)shortNameByHasc:(NSString *)hasc baseHasc:(NSString *)baseHasc
{
    if (![self _checkVaildForShortName:hasc baseHasc:baseHasc]) return nil;
    
    NSString *c = [hasc substringToIndex:2];
    NSString *seperator = nil;
    BOOL asc;
    if ([c isEqualToString:@"CN"]) {
        seperator = @"·";
        asc = YES;
    } else {
        seperator = @",";
        asc = NO;
    }
    return [self _shortNameByHasc:hasc seperator:seperator asc:asc baseHasc:baseHasc];
}

+ (NSString *)shortNameByHasc:(NSString *)hasc seperator:(NSString *)seperator baseHasc:(NSString *)baseHasc
{
    if (![self _checkVaildForShortName:hasc baseHasc:baseHasc]) return nil;
    NSString *c = [hasc substringToIndex:2];
    BOOL asc;
    if ([c isEqualToString:@"CN"]) {
        asc = YES;
    } else {
        asc = NO;
    }
    return [self _shortNameByHasc:hasc seperator:seperator asc:asc baseHasc:baseHasc];
}

+ (NSString *)shortNameByHasc:(NSString *)hasc asc:(BOOL)asc baseHasc:(NSString *)baseHasc
{
    if (![self _checkVaildForShortName:hasc baseHasc:baseHasc]) return nil;
    
    NSString *c = [hasc substringToIndex:2];
    NSString *seperator = nil;
    if ([c isEqualToString:@"CN"]) {
        seperator = @"·";
    } else {
        seperator = @",";
    }
    return [self _shortNameByHasc:hasc seperator:seperator asc:asc baseHasc:baseHasc];
}


+ (NSString *)shortNameByHasc:(NSString *)hasc seperator:(NSString *)seperator asc:(BOOL)asc baseHasc:(NSString *)baseHasc;
{
    if (![self _checkVaildForShortName:hasc baseHasc:baseHasc]) return nil;
    
    return [self _shortNameByHasc:hasc seperator:seperator asc:asc baseHasc:baseHasc];
}

+ (NSString *)nameWithoutProvice:(NSString *)hasc seperator:(NSString *)seperator asc:(BOOL)asc
{
    if (![self _checkHascVaild:hasc]) return nil;
    
    return [self _nameWithoutProvice:hasc seperator:seperator asc:asc];
}
+ (NSString *)nameWithoutProvice:(NSString *)hasc seperator:(NSString *)seperator
{
    if (![self _checkHascVaild:hasc]) return nil;
    
    NSString *c = [hasc substringToIndex:2];
    BOOL asc;
    if ([c isEqualToString:@"CN"]) {
        asc = YES;
    } else {
        asc = NO;
    }
    
    return [self _nameWithoutProvice:hasc seperator:seperator asc:asc];
}
+ (NSString *)nameWithoutProvice:(NSString *)hasc asc:(BOOL)asc
{
    if (![self _checkHascVaild:hasc]) return nil;
    
    NSString *c = [hasc substringToIndex:2];
    NSString *seperator = nil;
    if ([c isEqualToString:@"CN"]) {
        seperator = @"·";
    } else {
        seperator = @",";
    }
    
    return [self _nameWithoutProvice:hasc seperator:seperator asc:asc];
}
+ (NSString *)nameWithoutProvince:(NSString *)hasc
{
    if (![self _checkHascVaild:hasc]) return nil;
    
    NSString *c = [hasc substringToIndex:2];
    NSString *seperator = nil;
    BOOL asc;
    if ([c isEqualToString:@"CN"]) {
        seperator = @"·";
        asc = YES;
    } else {
        seperator = @",";
        asc = NO;
    }
    
    return [self _nameWithoutProvice:hasc seperator:seperator asc:asc];
}


#pragma mark - private

+ (BOOL)_checkVaildForShortName:(NSString *)hasc baseHasc:(NSString *)baseHasc
{
    if (!hasc || ![hasc isKindOfClass:[NSString class]] || hasc.length < 2 || ![baseHasc isKindOfClass:[NSString class]] || baseHasc.length < 2) {
        return NO;
    }
    YHRegionModel *model = [self modelForHasc:baseHasc];
    YHRegionModel *basemodel = [self modelForHasc:baseHasc];
    //只有last为1的model才有返回值
    if (!model || !model.last || !basemodel || !basemodel.last) {
        return NO;
    }
    return YES;
}

+ (BOOL)_checkHascVaild:(NSString *)hasc
{
    if (!hasc || ![hasc isKindOfClass:[NSString class]] || hasc.length < 2) {
        return NO;
    }
    return YES;
}

+ (NSString *)_shortNameByHasc:(NSString *)hasc seperator:(NSString *)seperator asc:(BOOL)asc baseHasc:(NSString *)baseHasc
{
    hasc = [hasc uppercaseString];
    baseHasc = [baseHasc uppercaseString];
    if ([hasc isEqualToString:baseHasc]) {
        return [self modelForHasc:hasc].currentName;
    } else if ([[hasc substringToIndex:2] isEqualToString:[baseHasc substringToIndex:2]]) {
        //国家相同,当只有国家，显示国家，有省份及以下，省份无论是否相同，都像是，省份，城市
        if (hasc.length == 2) {
            //只有国家一级
            return [self modelForHasc:hasc].currentName;
        } else {
            NSMutableArray *names = [NSMutableArray array];
            NSRange range;
            do {
                if (hasc.length == 2) break;
                YHRegionModel *tmpModel = [YHRegionManager modelForHasc:hasc];
                [names addObject:[tmpModel currentName]];
                range = [hasc rangeOfString:@"." options:NSBackwardsSearch];
                if (range.length != NSNotFound) {
                    hasc = [hasc substringToIndex:range.location];
                }
                
            } while (range.location != NSNotFound);
            if (!asc) {
                return [names componentsJoinedByString:seperator ?: @" "];
            } else {
                return [[[names reverseObjectEnumerator] allObjects] componentsJoinedByString:seperator ?: @" "];
            }
        }
    } else {
        return [self fullNameByHasc:hasc seperator:seperator asc:asc];
    }
}

+ (NSString *)_fullNameByHasc:(NSString *)hasc seperator:(NSString *)seperator asc:(BOOL)asc
{
    hasc = [hasc uppercaseString];
    NSRange range;
    NSMutableArray *fullLocalName = [NSMutableArray arrayWithCapacity:3];
    do {
        YHRegionModel *data = [YHRegionManager modelForHasc:hasc];
        if(!data)
        {
            return nil;
        }
        [fullLocalName addObject:[data currentName]];
        range = [hasc rangeOfString:@"." options:NSBackwardsSearch];
        if(range.location != NSNotFound)
        {
            hasc = [hasc substringToIndex:range.location];
        }
    } while (range.location != NSNotFound);
    if(asc)
    {
        return [[[fullLocalName reverseObjectEnumerator] allObjects] componentsJoinedByString:seperator?seperator:@" "];
    }
    else
    {
        return [fullLocalName componentsJoinedByString:seperator?seperator:@" "];
    }
}

+ (NSString *)_nameWithoutProvice:(NSString *)hasc seperator:(NSString *)seperator asc:(BOOL)asc
{
    hasc = [hasc uppercaseString];
    NSRange range;
    NSMutableArray *tmpArr = [NSMutableArray array];
    do {
        YHRegionModel *data = [YHRegionManager modelForHasc:hasc];
        if (!data) {
            return nil;
        }
        [tmpArr addObject:[data currentName]];
        range = [hasc rangeOfString:@"." options:NSBackwardsSearch];
        if (range.location != NSNotFound) {
            hasc = [hasc substringToIndex:range.location];
        }
    } while (range.location != NSNotFound);
    NSMutableArray *names = [NSMutableArray array];
    if (tmpArr.count == 1) {
        [names addObjectsFromArray:tmpArr];
    } else {
        [names addObject:tmpArr.lastObject];
        [names addObject:tmpArr.firstObject];
    }
    if(asc)
    {
        return [[[names reverseObjectEnumerator] allObjects] componentsJoinedByString:seperator?seperator:@" "];
    }
    else
    {
        return [names componentsJoinedByString:seperator?seperator:@" "];
    }
}
@end
