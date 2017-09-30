//
//  PropertyPicker.m
//  yichengpai
//
//  Created by Kevin on 2017/8/27.
//  Copyright © 2017年 zzy. All rights reserved.
//

#import "PropertyPicker.h"
#import "SmartActionSheetDataPicker.h"
#import "Properties.h"

static NSString *const PropertyCodeElement   = @"id";
static NSString *const PropertyNameElement   = @"name";
static NSString *const PropertyChildElement    = @"";

@implementation PropertyPicker

+(instancetype)initPickerWithType:(APPPropertyType)propertyType doneBlock:(PropertyPickerDoneBlock)doneBlock cancelBlock:(PropertyPickerCancelBlock)cancelBlock{
    return [PropertyPicker initPickerWithTitle:@"请选择" propertyType:propertyType doneBlock:doneBlock cancelBlock:cancelBlock];
}

+(instancetype)initPickerWithTitle:(NSString *)title propertyType:(APPPropertyType)propertyType doneBlock:(PropertyPickerDoneBlock)doneBlock cancelBlock:(PropertyPickerCancelBlock)cancelBlock{
    PropertyPicker *propertyPicker = [[PropertyPicker alloc] initWithTitle:title propertyType:propertyType doneBlock:doneBlock cancelBlock:cancelBlock];
    
    return propertyPicker;
}

/**
 *  Show picker
 *
 *  @param title            title
 *  @param doneBlock        done block
 *  @param cancelBlock      cancle block
 *
 *  @return
 */
- (instancetype)initWithTitle:(NSString *)title
                 propertyType:(APPPropertyType)propertyType
                    doneBlock:(PropertyPickerDoneBlock)doneBlock
                  cancelBlock:(PropertyPickerCancelBlock)cancelBlock
{
    self = [super init];
    if (self) {
        self.onPropertyPickerDoneBlock = doneBlock;
        self.onPropertyPickerCancelBlock = cancelBlock;
        self.pickerTitle = title;
        self.propertyType = propertyType;
    }
    return self;
}


-(void)showWithDefault:(PropertyModel *)defaultProperty sender:(id)sender{
    NSArray *array = [NSArray array];
    Properties *properties = [Properties sharedInstance];
    switch (self.propertyType) {
        case TRANSMISSION:
            array = properties.transmissionArray;
            break;
        case MAINTAIN_LEVEL:
            array = properties.maintainLevelArray;
            break;
        case COLOR:
            array = properties.colorArray;
            break;
        case ENGINE_CAPACITY:
            array = properties.engineCapacity;
            break;
        case FUELOIL_TYPE:
            array = properties.fuelOilType;
            break;
        case PURPOSE:
            array = properties.purpose;
            break;
        case SITUATION_LEVEL:
            array = properties.situationLevel;
            break;
        case VEHICLE_TYPE:
            array = properties.vehicleType;
            break;
        case CAR_SORT:
            array = properties.carSort;
            break;
        case EMISSION:
            array = properties.emission;
            break;
        case BID_TYPE:
            array = properties.bidType;
            break;
        case PAINT_SITUATION:
            array = properties.paintSituation;
            break;
        case CAR_KEYS_NUMBER:
            array = properties.carKeys;
            break;
        case SKY_WINDOW:
            array = properties.skyWindow;
            break;
        case SOAKED_WATER_CAR:
            array = properties.isSoakedWaterCar;
            break;
        case ACCIDENT_CAR:
            array = properties.isAccidentCar;
            break;
        case FIRE_CAR:
            array = properties.isFireCar;
            break;
        default:
            break;
    }
//    NSDictionary *dict11 = [NSDictionary dictionaryWithObjectsAndKeys:@"100", PropertyCodeElement, @"红色", PropertyNameElement, nil];
//    NSDictionary *dict12 = [NSDictionary dictionaryWithObjectsAndKeys:@"101", PropertyCodeElement, @"蓝色", PropertyNameElement, nil];
//    NSDictionary *dict13 = [NSDictionary dictionaryWithObjectsAndKeys:@"102", PropertyCodeElement, @"黑色", PropertyNameElement, nil];
//    NSDictionary *dict14 = [NSDictionary dictionaryWithObjectsAndKeys:@"103", PropertyCodeElement, @"白色", PropertyNameElement, nil];
//    array = [NSArray arrayWithObjects:dict11, dict12, dict13, dict14, nil];
    
    @weakify(self)
    SmartActionSheetDataPicker *picker = [SmartActionSheetDataPicker smartPickerWithTitle:self.pickerTitle codeElement:PropertyCodeElement nameElement:PropertyNameElement childElement:PropertyChildElement initialSelection:nil doneBlock:^(SmartActionSheetDataPicker *picker, id selectedData, id origin) {
        NSArray *array = (NSArray *)selectedData;
        _selectedProperty = nil;
        _selectedProperty = [[PropertyModel alloc] init];
        
        if (array != nil && [array isKindOfClass:[NSArray class]] && array.count > 0) {
            NSDictionary *provinceDict = [array objectAtIndex:0];
            _selectedProperty.propertyId = [provinceDict objectForKey:PropertyCodeElement];
            _selectedProperty.propertyName = [provinceDict objectForKey:PropertyNameElement];
            @strongify(self)
            if (self.onPropertyPickerDoneBlock != nil) {
                self.onPropertyPickerDoneBlock(_selectedProperty);
            }
        }
    } cancelBlock:^(SmartActionSheetDataPicker *picker) {
        @strongify(self)
        if (self.onPropertyPickerCancelBlock != nil) {
            self.onPropertyPickerCancelBlock();
        }
    } origin:sender];
    NSArray *defaultArr = nil;
    if (defaultProperty != nil && defaultProperty.propertyId != nil && defaultProperty.propertyName != nil) {
        NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:defaultProperty.propertyId, PropertyCodeElement, nil, PropertyNameElement, nil];
        defaultArr = [NSArray arrayWithObjects:dict1, nil];
    }
    picker.controllerView = nil;
    picker.defaultSelected = defaultArr;
    picker.dataSource = array;
    picker.tapDismissAction = TapActionCancel;
    picker.numberOfComponents = 1;
    picker.searchKeyElement = OnlyByCodeElement;
    [picker showActionSheetPicker];
}


-(PropertyModel *)getPropertyById:(NSInteger )propertyId propertyType:(APPPropertyType)propertyType{
    PropertyModel *model = [[PropertyModel alloc] init];
    NSArray *array = [NSArray array];
    Properties *properties = [Properties sharedInstance];
    switch (propertyType) {
        case TRANSMISSION:
            array = properties.transmissionArray;
            break;
        case MAINTAIN_LEVEL:
            array = properties.maintainLevelArray;
            break;
        case COLOR:
            array = properties.colorArray;
            break;
        case ENGINE_CAPACITY:
            array = properties.engineCapacity;
            break;
        case FUELOIL_TYPE:
            array = properties.fuelOilType;
            break;
        case PURPOSE:
            array = properties.purpose;
            break;
        case SITUATION_LEVEL:
            array = properties.situationLevel;
            break;
        case VEHICLE_TYPE:
            array = properties.vehicleType;
            break;
        case CAR_SORT:
            array = properties.carSort;
            break;
        case EMISSION:
            array = properties.emission;
            break;
        case BID_TYPE:
            array = properties.bidType;
            break;
        case PAINT_SITUATION:
            array = properties.paintSituation;
            break;
        case CAR_KEYS_NUMBER:
            array = properties.carKeys;
            break;
        case SKY_WINDOW:
            array = properties.skyWindow;
            break;
        case FIRE_CAR:
            array = properties.isFireCar;
            break;
        case SOAKED_WATER_CAR:
            array = properties.isSoakedWaterCar;
            break;
        case ACCIDENT_CAR:
            array = properties.isAccidentCar;
            break;
        default:
            break;
    }
    for (int i = 0; i < array.count; i++) {
        NSDictionary *dict = [array objectAtIndex:i];
        if (dict != nil && [dict isKindOfClass:[NSDictionary class]]) {
            if( [[dict objectForKey:PropertyCodeElement] integerValue] == propertyId){
                model.propertyId = [NSString stringWithFormat:@"%d",propertyId];
                model.propertyName = [dict objectForKey:PropertyNameElement];
            }
        }
    }
    
    return model;
}


@end
