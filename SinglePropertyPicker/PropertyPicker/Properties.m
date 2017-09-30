//
//  Properties.m
//  yichengpai
//
//  Created by Kevin on 2017/8/26.
//  Copyright © 2017年 zzy. All rights reserved.
//

#import "Properties.h"
#import "PropertyModel.h"

static NSString *const PropertyCodeElement   = @"id";
static NSString *const PropertyNameElement   = @"name";
static NSString *const PropertyChildElement    = @"";

#define PROPERTY_FILE_NAME @"user_peroperties.plist"
#define PROPERTY_FOLDER @"SystemProperty"

@implementation Properties

+ (Properties *)sharedInstance{
    static Properties *properties;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        properties = [[self alloc] init];
    });
    return properties;
}


//保存用户信息到本地文件
- (void)savePropertyDataToLocal{
    //获取文件路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    docPath = [docPath stringByAppendingPathComponent:PROPERTY_FOLDER];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL *isDir = NULL;
    NSError *error = NULL;
    if (![fileManager fileExistsAtPath:docPath isDirectory:isDir]) {
        [fileManager createDirectoryAtPath:docPath withIntermediateDirectories:YES attributes:nil error:&error];
    }
    NSString *targetPath = [docPath stringByAppendingPathComponent:PROPERTY_FILE_NAME];
    
    //将自定义对象保存在指定路径下
    BOOL result = [NSKeyedArchiver archiveRootObject:self toFile:targetPath];
    NSLog(@"保存用户信息%@",result?@"成功":@"失败");
}

//读取本地用户信息
- (Properties *)getPropertyDataFromLocal{
    //获取文件路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    docPath = [docPath stringByAppendingPathComponent:PROPERTY_FOLDER];
    NSString *targetPath = [docPath stringByAppendingPathComponent:PROPERTY_FILE_NAME];
    
    Properties *person = [NSKeyedUnarchiver unarchiveObjectWithFile:targetPath];
    if (person) {
        _transmissionArray = person.transmissionArray;
        _maintainLevelArray = person.maintainLevelArray;
        _colorArray = person.colorArray;
        _engineCapacity = person.engineCapacity;
        _fuelOilType = person.fuelOilType;
        _purpose = person.purpose;
        _situationLevel = person.situationLevel;
        _vehicleType = person.vehicleType;
        _carSort = person.carSort;
        _emission = person.emission;
        _bidType = person.bidType;
        _paintSituation = person.paintSituation;
        _carKeys = person.carKeys;
        _skyWindow = person.skyWindow;
        _isSoakedWaterCar = person.isSoakedWaterCar;
        _isAccidentCar = person.isAccidentCar;
        _isFireCar = person.isFireCar;
        _qiNiuHost = person.qiNiuHost;
    }else{
        person = [[Properties alloc] init];
    }
    
    return person;
}

//当进行归档操作的时候就会调用该方法
//在该方法中要写清楚要存储对象的哪些属性
- (void)encodeWithCoder:(NSCoder *)aCoder{
    //    NSLog(@"调用了encodeWithCoder方法");
    [aCoder encodeObject:_transmissionArray forKey:@"transmissionArray"];
    [aCoder encodeObject:_maintainLevelArray forKey:@"maintainLevelArray"];
    [aCoder encodeObject:_colorArray forKey:@"colorArray"];
    [aCoder encodeObject:_engineCapacity forKey:@"engineCapacity"];
    [aCoder encodeObject:_fuelOilType forKey:@"fuelOilType"];
    [aCoder encodeObject:_purpose forKey:@"purpose"];
    [aCoder encodeObject:_situationLevel forKey:@"situationLevel"];
    [aCoder encodeObject:_vehicleType forKey:@"vehicleType"];
    [aCoder encodeObject:_carSort forKey:@"carSort"];
    [aCoder encodeObject:_emission forKey:@"emission"];
    [aCoder encodeObject:_bidType forKey:@"bidType"];
    [aCoder encodeObject:_paintSituation forKey:@"paintSituation"];
    [aCoder encodeObject:_carKeys forKey:@"carKeys"];
    [aCoder encodeObject:_skyWindow forKey:@"skyWindow"];
    [aCoder encodeObject:_isSoakedWaterCar forKey:@"isSoakedWaterCar"];
    [aCoder encodeObject:_isAccidentCar forKey:@"isAccidentCar"];
    [aCoder encodeObject:_isFireCar forKey:@"isFireCar"];
    [aCoder encodeObject:_qiNiuHost forKey:@"qiNiuHost"];
    
}

//当进行解档操作的时候就会调用该方法
//在该方法中要写清楚要提取对象的哪些属性
- (id)initWithCoder:(NSCoder *)aDecoder
{
    //    NSLog(@"调用了initWithCoder方法");
    if (self = [super init]) {
        self.transmissionArray = [aDecoder decodeObjectForKey:@"transmissionArray"];
        self.maintainLevelArray = [aDecoder decodeObjectForKey:@"maintainLevelArray"];
        self.colorArray = [aDecoder decodeObjectForKey:@"colorArray"];
        self.engineCapacity = [aDecoder decodeObjectForKey:@"engineCapacity"];
        self.fuelOilType = [aDecoder decodeObjectForKey:@"fuelOilType"];
        self.purpose = [aDecoder decodeObjectForKey:@"purpose"];
        self.situationLevel = [aDecoder decodeObjectForKey:@"situationLevel"];
        self.vehicleType = [aDecoder decodeObjectForKey:@"vehicleType"];
        self.carSort = [aDecoder decodeObjectForKey:@"carSort"];
        self.emission = [aDecoder decodeObjectForKey:@"emission"];
        self.bidType = [aDecoder decodeObjectForKey:@"bidType"];
        self.paintSituation = [aDecoder decodeObjectForKey:@"paintSituation"];
        self.carKeys = [aDecoder decodeObjectForKey:@"carKeys"];
        self.skyWindow = [aDecoder decodeObjectForKey:@"skyWindow"];
        self.isSoakedWaterCar = [aDecoder decodeObjectForKey:@"isSoakedWaterCar"];
        self.isAccidentCar = [aDecoder decodeObjectForKey:@"isAccidentCar"];
        self.isFireCar = [aDecoder decodeObjectForKey:@"isFireCar"];
        self.qiNiuHost = [aDecoder decodeObjectForKey:@"qiNiuHost"];
    }
    return self;
}


@end
