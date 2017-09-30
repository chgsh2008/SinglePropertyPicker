//
//  PropertyPicker.h
//  yichengpai
//
//  Created by Kevin on 2017/8/27.
//  Copyright © 2017年 zzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PropertyModel.h"
#import "APPEnum.h"


typedef void(^PropertyPickerDoneBlock)(PropertyModel *properties);
typedef void(^PropertyPickerCancelBlock)();


@interface PropertyPicker : NSObject


@property (nonatomic, copy) PropertyPickerDoneBlock onPropertyPickerDoneBlock;
@property (nonatomic, copy) PropertyPickerCancelBlock onPropertyPickerCancelBlock;

@property (nonatomic, strong) NSString *pickerTitle;
@property (nonatomic, strong) PropertyModel *selectedProperty;
@property (nonatomic, assign) APPPropertyType propertyType;



/**
 *  init picker
 *
 *  @param doneBlock        done block
 *  @param cancelBlock      cancle block
 *
 *  @return
 */
+ (instancetype)initPickerWithType:(APPPropertyType)propertyType
                            doneBlock:(PropertyPickerDoneBlock)doneBlock
                           cancelBlock:(PropertyPickerCancelBlock)cancelBlock;


/**
 *  init picker
 *
 *  @param title            title
 *  @param doneBlock        done block
 *  @param cancelBlock      cancle block
 *
 *  @return
 */
+ (instancetype)initPickerWithTitle:(NSString *)title
                       propertyType:(APPPropertyType)propertyType
                              doneBlock:(PropertyPickerDoneBlock)doneBlock
                            cancelBlock:(PropertyPickerCancelBlock)cancelBlock;



-(void)showWithDefault:(PropertyModel *)defaultProperty sender:(id)sender;


-(PropertyModel *)getPropertyById:(NSInteger )propertyId propertyType:(APPPropertyType)propertyType;


@end
