//
//  APPEnum.h
//  yichengpai
//
//  Created by Kevin on 2017/8/25.
//  Copyright © 2017年 zzy. All rights reserved.
//

#import <Foundation/Foundation.h>



typedef NS_ENUM(NSInteger, APPPropertyType) {
    //变速箱 ：手动、自动
    TRANSMISSION,
    //维护级别: ++、+、-、--
    MAINTAIN_LEVEL,
    //颜色
    COLOR,
    //发动机排量
    ENGINE_CAPACITY,
    //燃油类型
    FUELOIL_TYPE,
    //车辆用途
    PURPOSE,
    //状况级别A, B， C, D
    SITUATION_LEVEL,
    //车辆类型
    VEHICLE_TYPE,
    //发拍车辆分类
    CAR_SORT,
    //排放标准
    EMISSION,
    //竞拍类型
    BID_TYPE,
    //漆面状态
    PAINT_SITUATION,
    //钥匙数量
    CAR_KEYS_NUMBER,
    //是否有天窗
    SKY_WINDOW,
    //是否水泡车
    SOAKED_WATER_CAR,
    //是否事故车
    ACCIDENT_CAR,
    //是否火烧车
    FIRE_CAR,
    //区域
    CAR_AREA
};

//用户资料认证等级
typedef NS_ENUM(NSInteger, YCPUserInfoCertificateType) {
    //未填写资料
    USER_INFO_NEW = 0,
    //未审核
    USER_INFO_SUBMIT = 1,
    //已通过
    USER_INFO_APPROVED = 2,
    //不通过
    USER_INFO_REJECTED = 3
};


