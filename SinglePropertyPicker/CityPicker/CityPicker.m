//
//  CityPicker.m
//  yichengpai
//
//  Created by Kevin on 2017/8/27.
//  Copyright © 2017年 zzy. All rights reserved.
//

#import "CityPicker.h"
#import "SmartActionSheetDataPicker.h"


static NSString *const CityPickerCodeElement   = @"id";
static NSString *const CityPickerNameElement   = @"name";
static NSString *const CityPickerChildElement    = @"city";


@interface CityModel()

@end


@implementation CityPicker



/**
 *  init picker
 *
 *  @param doneBlock        done block
 *  @param cancelBlock      cancle block
 *
 *  @return
 */
+ (instancetype)initCityPickerWithBock:(CityPickerDoneBlock)doneBlock
                           cancelBlock:(CityPickerCancelBlock)cancelBlock{
    return [CityPicker initCityPickerWithTitle:@"请选择城市" doneBlock:doneBlock cancelBlock:cancelBlock];
}



/**
 *  init picker
 *
 *  @param title            title
 *  @param doneBlock        done block
 *  @param cancelBlock      cancle block
 *
 *  @return
 */
+ (instancetype)initCityPickerWithTitle:(NSString *)title
                              doneBlock:(CityPickerDoneBlock)doneBlock
                            cancelBlock:(CityPickerCancelBlock)cancelBlock
{
    CityPicker *cityPicker = [[CityPicker alloc] initWithTitle:title doneBlock:doneBlock cancelBlock:cancelBlock];
    
    return cityPicker;
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
                    doneBlock:(CityPickerDoneBlock)doneBlock
                  cancelBlock:(CityPickerCancelBlock)cancelBlock
{
    self = [super init];
    if (self) {
        self.onCityPickerDoneBlock = doneBlock;
        self.onCityPickerCancelBlock = cancelBlock;
        self.pickerTitle = title;
//        SmartActionSheetDataPicker *picker = [[SmartActionSheetDataPicker alloc] initWithTitle:title codeElement:codeElement nameElement:nameElement childElement:childElement initialSelection:initialSelection doneBlock:doneBlock cancelBlock:cancelBlock origin:view];
        
    }
    return self;
}

-(void)showWithDefault:(CityModel *)defaultCity sender:(id)sender{
    NSDictionary *dictData = nil;
    NSString *resource=@"cityData.json";
    NSString *file = [[NSBundle mainBundle] pathForResource:resource ofType:nil];
    dictData = [self getContentWithPath:file];
    NSDictionary *dictData2 = [dictData objectForKey:@"province"];
    if (dictData2 == nil) {
        NSLog(@"读取文件转换出错");
        return;
    }
    @weakify(self)
    SmartActionSheetDataPicker *picker = [SmartActionSheetDataPicker smartPickerWithTitle:self.pickerTitle codeElement:CityPickerCodeElement nameElement:CityPickerNameElement childElement:CityPickerChildElement initialSelection:nil doneBlock:^(SmartActionSheetDataPicker *picker, id selectedData, id origin) {
        NSArray *array = (NSArray *)selectedData;
        _selectCity = nil;
        _selectCity = [[CityModel alloc] init];
        
        if (array != nil && [array isKindOfClass:[NSArray class]] && array.count > 1) {
            NSDictionary *provinceDict = [array objectAtIndex:0];
            NSDictionary *cityDict = [array objectAtIndex:1];
            _selectCity.provinceId = [provinceDict objectForKey:CityPickerCodeElement];
            _selectCity.provinceName = [provinceDict objectForKey:CityPickerNameElement];
            _selectCity.cityId = [cityDict objectForKey:CityPickerCodeElement];
            _selectCity.cityName = [cityDict objectForKey:CityPickerNameElement];
            @strongify(self)
            if (self.onCityPickerDoneBlock != nil) {
                self.onCityPickerDoneBlock(_selectCity);
            }
        }
    } cancelBlock:^(SmartActionSheetDataPicker *picker) {
        @strongify(self)
        if (self.onCityPickerCancelBlock != nil) {
            self.onCityPickerCancelBlock();
        }
    } origin:sender];
    NSArray *defaultArr = nil;
    if (defaultCity != nil && defaultCity.provinceId != nil && defaultCity.cityId != nil) {
        NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:defaultCity.provinceId, CityPickerCodeElement, nil, CityPickerNameElement, nil];
        NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:defaultCity.cityId, CityPickerCodeElement, nil, CityPickerNameElement, nil];
        defaultArr = [NSArray arrayWithObjects:dict1, dict2, nil];
    }
    picker.controllerView = nil;
    picker.defaultSelected = defaultArr;
    picker.dataSource = dictData2;
    picker.tapDismissAction = TapActionCancel;
    picker.numberOfComponents = 2;
    picker.searchKeyElement = OnlyByCodeElement;
    [picker showActionSheetPicker];
}


-(NSDictionary *)getContentWithPath:(NSString *)file{
    NSDictionary *dictData = nil;
    //    NSError *error;
    //    NSString *file = [[NSBundle mainBundle] pathForResource:@"data1.json" ofType:nil];
    //    NSString * content = [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:&error];
    NSData *data = [[NSMutableData alloc] initWithContentsOfFile:file];
    NSError *error;
    dictData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    //    NSLog(@"json:%@",dictData);
    
    return dictData;
}

@end
