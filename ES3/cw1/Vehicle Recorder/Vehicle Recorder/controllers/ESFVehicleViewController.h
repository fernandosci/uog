//
//  RecorderViewController.h
//  Vehicle Recorder
//
//  Created by Fernando on 11/02/2015.
//  Copyright (c) 2015 Fernando. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../model/ESFVehicle.h"

@interface ESFVehicleViewController : UIViewController <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate>

- (IBAction)buttonRecordTouchHandler:(id)sender;

- (BOOL) textFieldShouldReturn:(UITextField *)textField;

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component;

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component;

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info;

@property (copy) NSMutableArray *vehicleModels;

@end
