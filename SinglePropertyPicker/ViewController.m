//
//  ViewController.m
//  SinglePropertyPicker
//
//  Created by Kevin on 2017/9/30.
//  Copyright © 2017年 Kevin. All rights reserved.
//

#import "ViewController.h"
#import "Properties.h"
#import "PropertyModel.h"
#import "PropertyPicker.h"
#import "CityPicker.h"

@interface ViewController ()

@property (strong, nonatomic) PropertyModel *colorProperty;
@property (strong, nonatomic) CityModel *carCity;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _colorProperty = [[PropertyModel alloc] init];
    _carCity = [[CityModel alloc] init];
    
    NSArray *array =@[
                      @{
                          @"id":@"1",
                          @"name":@"红色",
                          @"value":@""
                          },
                      @{
                          @"id":@"2",
                          @"name":@"黑色",
                          @"value":@""
                          },
                      @{
                          @"id":@"3",
                          @"name":@"蓝色",
                          @"value":@""
                          }
                      ];
    
    Properties *property = [Properties sharedInstance];
    property.situationLevel = array;
    property.colorArray = array;
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)propertyPicker:(APPPropertyType)propertyType textField:(UITextField *)textField propertyModel:(PropertyModel *)propertyModel{
    
    PropertyPicker *propertyPicker = [PropertyPicker initPickerWithType:propertyType doneBlock:^(PropertyModel *properties) {
        propertyModel.propertyId = properties.propertyId;
        propertyModel.propertyName = properties.propertyName;
        propertyModel.propertyValue = properties.propertyValue;
        textField.text = properties.propertyName;
    } cancelBlock:^{
        
    }];
    [propertyPicker showWithDefault:propertyModel sender:textField];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)singlePropertySelect:(id)sender {
    [self propertyPicker:COLOR textField:_textField1 propertyModel:self.colorProperty];
}

- (IBAction)citySelect:(id)sender {
    @weakify(self)
    CityPicker *cityPicker = [CityPicker initCityPickerWithBock:^(CityModel *city) {
        @strongify(self)
        self.carCity = city;
        self.textField2.text = [NSString stringWithFormat:@"%@ %@", city.provinceName, city.cityName];
    } cancelBlock:nil];
    [cityPicker showWithDefault:self.carCity sender:sender];
    
}
@end
