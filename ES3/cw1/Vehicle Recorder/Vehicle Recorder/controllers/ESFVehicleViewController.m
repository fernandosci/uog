//
//  RecorderViewController.m
//  Vehicle Recorder
//
//  Created by Fernando on 11/02/2015.
//  Copyright (c) 2015 Fernando. All rights reserved.
//

#import "ESFVehicleViewController.h"

@interface ESFVehicleViewController ()
@property (weak, nonatomic) IBOutlet UITextField *reg1TextField;
@property (weak, nonatomic) IBOutlet UITextField *reg2TextField;
@property (weak, nonatomic) IBOutlet UITextField *reg3TextField;
@property (weak, nonatomic) IBOutlet UIPickerView *vehiclePickerView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *carTypeSegmentedControl;

- (void) getPicture;


@end

@implementation ESFVehicleViewController

@synthesize vehicleModels = _vehicleModels;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.vehicleModels =  [NSMutableArray arrayWithObjects:
                           @"---",
                           @"Abarth",
                           @"Alfa Romeo",
                           @"Aston Martin",
                           @"Audi",
                           @"Bentley",
                           @"BMW",
                           @"Bugatti",
                           @"Cadillac",
                           @"Caterham",
                           @"Chevrolet",
                           @"Chrysler",
                           @"Citroen",
                           @"Dacia",
                           @"Ferrari",
                           @"Fiat",
                           @"Ford",
                           @"Honda",
                           @"Hyundai",
                           @"Infiniti",
                           @"Jaguar",
                           @"Jeep",
                           @"Kia",
                           @"Lamborghini",
                           @"Land Rover",
                           @"Lexus",
                           @"Lotus",
                           @"Maserati",
                           @"Mazda",
                           @"Mclaren",
                           @"Mercedes-Benz",
                           @"MG",
                           @"Mini",
                           @"Mitsubishi",
                           @"Morgan",
                           @"Nissan",
                           @"Noble",
                           @"Pagani",
                           @"Peugeot",
                           @"Porsche",
                           @"Radical",
                           @"Renault",
                           @"Rolls-Royce",
                           @"Saab",
                           @"Seat",
                           @"Skoda",
                           nil
                           ];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    return [self.vehicleModels count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component{
    return [self.vehicleModels objectAtIndex:row];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

    
- (IBAction)buttonRecordTouchHandler:(id)sender{
    
    [self getPicture];
   //  NSString  * result = [@[_registration1, _registration2, _registration3] componentsJoinedByString:nil];
    NSLog(@"teste  ");
}

- (void) getPicture{
    
    //create a picker
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    // allow user to pan and crop image
    imagePicker.allowsEditing = YES;
    //send messages to this view controller
    imagePicker.delegate = self;
    // select the camera as the input source
#if TARGET_IPHONE_SIMULATOR
    // on the emulator use UIPickerControllerSourceTypePhotoLibrary, to complex for apple to emulate a camera i guess
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
#else
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
#endif
    // present the picker
    [self presentViewController:imagePicker animated:YES completion:nil];
}



- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}
@end
