//
//  YHRegionManager.h
//  RegionDemo
//
//  Created by solot10 on 17/4/21.
//  Copyright © 2017年 solot10. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YHRegionModel.h"

@interface YHRegionManager : NSObject

+ (YHRegionModel *)modelForHasc:(NSString *)hasc;

//获取所有的国家
+ (NSArray<YHRegionModel *> *)allCountrys;

//获取指定hasc下属的所有地区
+ (NSArray<YHRegionModel *> *)subRegionByHasc:(NSString *)hasc;


/**
 根据hasc返回全称

 @param hasc hasc
 @param seperator 分隔符
 @param asc 是否正序显示
 @return 全称，@"中国·江苏·无锡"
 */
+ (NSString *)fullNameByHasc:(NSString *)hasc seperator:(NSString *)seperator asc:(BOOL)asc;
+ (NSString *)fullNameByHasc:(NSString *)hasc seperator:(NSString *)seperator;
+ (NSString *)fullNameByHasc:(NSString *)hasc asc:(BOOL)asc;
+ (NSString *)fullNameByHasc:(NSString *)hasc;


/**
 对照basehasc所指的地区，缩短返回名称的描述

 @param hasc hasc
 @param seperator 分隔符
 @param asc 是否正序
 @param baseHasc baseHasc
 @return 结果
 */
+ (NSString *)shortNameByHasc:(NSString *)hasc seperator:(NSString *)seperator asc:(BOOL)asc baseHasc:(NSString *)baseHasc;
+ (NSString *)shortNameByHasc:(NSString *)hasc seperator:(NSString *)seperator baseHasc:(NSString *)baseHasc;
+ (NSString *)shortNameByHasc:(NSString *)hasc asc:(BOOL)asc baseHasc:(NSString *)baseHasc;
+ (NSString *)shortNameByHasc:(NSString *)hasc baseHasc:(NSString *)baseHasc;


/**
 返回不带省份的名称

 @param hasc hasc
 @param seperator 分隔符
 @param asc 是否正序
 @return 结果。 @"中国·无锡"
 */
+ (NSString *)nameWithoutProvice:(NSString *)hasc seperator:(NSString *)seperator asc:(BOOL)asc;
+ (NSString *)nameWithoutProvice:(NSString *)hasc seperator:(NSString *)seperator;
+ (NSString *)nameWithoutProvice:(NSString *)hasc asc:(BOOL)asc;
+ (NSString *)nameWithoutProvince:(NSString *)hasc;

@end
