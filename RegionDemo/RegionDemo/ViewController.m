//
//  ViewController.m
//  RegionDemo
//
//  Created by solot10 on 17/4/21.
//  Copyright © 2017年 solot10. All rights reserved.
//

#import "ViewController.h"
#import "YHRegionModel.h"
#import <HQDBDecode/HQDBHelper.h>
#import "YHRegionManager.h"

@interface ViewController ()

@end


//@property (nonatomic, strong) NSString *hasc;
//@property (nonatomic, strong) NSString *enName;
//@property (nonatomic, strong) NSString *localName;
//@property (nonatomic, assign) BOOL last; //是否是最后一杯层级
//@property (nonatomic, strong) NSString *lang;
//@property (nonatomic, assign) BOOL channel;
//@property (nonatomic, assign) BOOL waters;
//@property (nonatomic, strong) NSString *latlng;    //城市中心的geohash
//@property (nonatomic, strong) NSString *cnName;
//
//@property (nonatomic, strong) NSString *pinyin;
//
//@property (nonatomic, assign) RegionLevel level;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    FMDatabaseQueue *queue = [HQDBHelper queueWithClass:[YHRegionModel class]];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"AdministrationModel" ofType:@"txt"];
//    NSError *error = nil;
//    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
//    NSArray *arr = [str componentsSeparatedByString:@"\n"];
//    NSMutableArray *tmpArr = [NSMutableArray array];
//    NSArray *keys = @[@"enName", @"cnName", @"localName", @"last", @"channel", @"hasc", @"lang", @"waters", @"latlng", @"pinyin"];
//    for (NSString *dataString in arr) {
//        NSArray *arr = [dataString componentsSeparatedByString:@","];
//        YHRegionModel *model = [[YHRegionModel alloc] init];
//        for (int i = 0; i < arr.count; i++) {
//            [model setValue:arr[i] forKey:keys[i]];
//        }
//        [tmpArr addObject:model];
//    }
//    [YHRegionModel hq_insertObjects:tmpArr];
    NSArray *allArr = [YHRegionManager allCountrys];
    NSLog(@"count____%d", allArr.count);
    
    NSArray *arr = [YHRegionManager subRegionByHasc:@"cn"];
    YHRegionModel *model = arr.firstObject;
    NSString *currentName = model.currentName;
    NSLog(@"__currentName___ %@", currentName);
    RegionLevel level = model.level;
    NSLog(@"___level____%d", level);
    
    NSString *fullName = [YHRegionManager fullNameByHasc:@"CN.JS.WX"];
    NSString *fullName2 = [YHRegionManager fullNameByHasc:@"CN.JS.WX" seperator:@"-"];
    NSString *fullName3 = [YHRegionManager fullNameByHasc:@"CN.JS.WX" asc:NO];
    NSString *fullName4 = [YHRegionManager fullNameByHasc:@"CN.JS.WX" seperator:@"-" asc:NO];
    
    NSLog(@"fullName %@ \n fullName2 %@\n fullName3 %@\n fullName4 %@\n", fullName, fullName2, fullName3, fullName4);
    
    
    NSString *shortName = [YHRegionManager shortNameByHasc:@"CN.JS.WX" baseHasc:@"CN.JS.NJ"];
    NSString *shortName2 = [YHRegionManager shortNameByHasc:@"CN.JS.WX" baseHasc:@"CN.JS.NJ"];
    NSString *shortName3 = [YHRegionManager shortNameByHasc:@"CN.JS.WX" baseHasc:@"CN.HB.LF"];
    NSString *shortName4 = [YHRegionManager shortNameByHasc:@"CN.JS.WX" seperator:@"_" asc:NO baseHasc:@"CN.HB.LF" ];
    NSString *shortName5 = [YHRegionManager shortNameByHasc:@"CN.JS.WX" seperator:@"_" asc:NO baseHasc:@"US.GA.JS" ];
//    US.GA.JS
    NSLog(@"shortName %@\n shortName2 %@\n shortName3 %@\n shortName4 %@\n shortName5 %@\n", shortName, shortName2, shortName3, shortName4, shortName5);
    
    NSString *name_withPorvice1 = [YHRegionManager nameWithoutProvince:@"CN.JS.WX"];
    NSString *name_withPorvice2 = [YHRegionManager nameWithoutProvice:@"CN.JS.WX" seperator:@"+" asc:NO];
    NSString *name_withPorvice3 = [YHRegionManager nameWithoutProvice:@"US.GA.JS" seperator:@"+" asc:NO];
    NSLog(@"name_withPorvice1 %@ \n name_withPorvice2 %@ \n name_withPorvice3 %@\n", name_withPorvice1, name_withPorvice2, name_withPorvice3);
    //enName, cnName, localName, last, channel, hasc, lang, waters, latlng, pinyin
    
    
//    YHRegionModel *model = [[YHRegionModel alloc] init];
//    model.
    NSLog(@"");
}


@end
