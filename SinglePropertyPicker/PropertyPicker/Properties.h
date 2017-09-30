//
//  Properties.h
//  yichengpai
//
//  Created by Kevin on 2017/8/26.
//  Copyright © 2017年 zzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Properties : NSObject<NSCoding>

+ (Properties *)sharedInstance;

//波箱/变速箱 ：手动、自动
@property(nonatomic, strong)NSArray *transmissionArray;

//维护级别: ++、+、-、--
@property(nonatomic, strong)NSArray *maintainLevelArray;

//车身颜色
@property(nonatomic, strong)NSArray *colorArray;

//发动机排量
@property(nonatomic, strong)NSArray *engineCapacity;

//燃油类型
@property(nonatomic, strong)NSArray *fuelOilType;

//车辆用途
@property(nonatomic, strong)NSArray *purpose;

//状况级别
@property(nonatomic, strong)NSArray *situationLevel;

//车辆类型
@property(nonatomic, strong)NSArray *vehicleType;

//发拍车辆分类
@property(nonatomic, strong)NSArray *carSort;

//排放标准
@property(nonatomic, strong)NSArray *emission;

//竞拍类型
@property(nonatomic, strong)NSArray *bidType;

//漆面状态
@property(nonatomic, strong)NSArray *paintSituation;

//钥匙
@property(nonatomic, strong)NSArray *carKeys;

//天窗
@property(nonatomic, strong)NSArray *skyWindow;

//是否水泡车
@property(nonatomic, strong)NSArray *isSoakedWaterCar;

//是否事故车
@property(nonatomic, strong)NSArray *isAccidentCar;

//是否火烧车
@property(nonatomic, strong)NSArray *isFireCar;



//七牛HOST地址
@property(nonatomic, strong)NSString *qiNiuHost;


//保存用户信息到本地文件
- (void)savePropertyDataToLocal;

//读取本地用户信息
-(Properties *)getPropertyDataFromLocal;


@end
