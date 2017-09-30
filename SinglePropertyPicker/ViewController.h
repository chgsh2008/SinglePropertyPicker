//
//  ViewController.h
//  SinglePropertyPicker
//
//  Created by Kevin on 2017/9/30.
//  Copyright © 2017年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ViewController : UIViewController
- (IBAction)singlePropertySelect:(id)sender;
- (IBAction)citySelect:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;


@end

