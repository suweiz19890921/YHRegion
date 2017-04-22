//
//  YHRegionModel.h
//  RegionDemo
//
//  Created by solot10 on 17/4/21.
//  Copyright © 2017年 solot10. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "NSObject+HQDBDecode.h"
//#import "HQDBHelper.h"
#import <HQDBDecode/HQDBHelper.h>
#import <HQDBDecode/NSObject+HQDBDecode.h>



typedef NS_ENUM(NSInteger, RegionLevel) {
    RegionLevelUnkonw = -1,
    RegionLevelOne,
    RegionLevelTwo,
    RegionLevelThree,
};

@interface YHRegionModel : NSObject<HQDBDecode>
/**
 hasc 主键
 */
@property (nonatomic, strong) NSString *hasc;
/**
 英文名
 */
@property (nonatomic, strong) NSString *enName;
/**
 当地语言的名字
 */
@property (nonatomic, strong) NSString *localName;
/**
 中文名
 */
@property (nonatomic, strong) NSString *cnName;
/**
 是否为最后一个层级的地区
 */
@property (nonatomic, assign) BOOL last; //是否是最后一杯层级
/**
 所在地区使用语言
 */
@property (nonatomic, strong) NSString *lang;
/**
 是否为沿海城市，1为沿海城市
 */
@property (nonatomic, assign) BOOL waters;
/**
 城市中心的geohash, 省为省会城市中心，国家为首都中心
 */
@property (nonatomic, strong) NSString *latlng;    //城市中心的geohash
/**
 拼音首字母
 */
@property (nonatomic, strong) NSString *pinyin;
/**
 该model所在国家的最大层级数
 */
@property (nonatomic, assign) RegionLevel level;

//暂时废弃
@property (nonatomic, assign) BOOL channel;
/// 根据语言获取当前名称
///
/// @return 地区名称
- (NSString *)currentName;

/// 获取当前地区的国家的hasc;
///
/// @return 国家hasc
- (NSString *)countryHasc;
@end
