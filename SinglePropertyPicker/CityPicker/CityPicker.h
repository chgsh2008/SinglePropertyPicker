//
//  CityPicker.h
//  yichengpai
//
//  Created by Kevin on 2017/8/27.
//  Copyright © 2017年 zzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityModel.h"

typedef void(^CityPickerDoneBlock)(CityModel *city);
typedef void(^CityPickerCancelBlock)();


@interface CityPicker : NSObject

@property (nonatomic, copy) CityPickerDoneBlock onCityPickerDoneBlock;
@property (nonatomic, copy) CityPickerCancelBlock onCityPickerCancelBlock;

@property (nonatomic, strong) NSString *pickerTitle;
@property (nonatomic, strong) CityModel *selectCity;




/**
 *  init picker
 *
 *  @param doneBlock        done block
 *  @param cancelBlock      cancle block
 *
 *  @return
 */
+ (instancetype)initCityPickerWithBock:(CityPickerDoneBlock)doneBlock
                            cancelBlock:(CityPickerCancelBlock)cancelBlock;


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
                         cancelBlock:(CityPickerCancelBlock)cancelBlock;



-(void)showWithDefault:(CityModel *)defaultCity sender:(id)sender;


@end
