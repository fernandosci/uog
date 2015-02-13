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

- (void) recordData:(NSData*)imageData;


@end

@implementation ESFVehicleViewController

@synthesize reg1TextField;
@synthesize reg2TextField;
@synthesize reg3TextField;
@synthesize vehiclePickerView;
@synthesize colorSegmentedControl;
@synthesize carTypeSegmentedControl;

@synthesize locationManager = _locationManager;
@synthesize vehicleModels = _vehicleModels;


- (void)viewDidLoad {
    [super viewDidLoad];
    _vehicleModels =  [NSMutableArray arrayWithObjects:
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
    
   
    
    _locationManager = [CLLocationManager new];
    
    [_locationManager startUpdatingLocation];
    
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
    
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    NSData *imageData = UIImagePNGRepresentation(image);
    
    [self recordData:imageData];
    
}


- (void) recordData:(NSData*)imageData{
    
    NSArray *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask, YES);
    NSString *homeDirectory = [documents objectAtIndex:0];
    NSString *randomName = [NSString stringWithFormat:@"/image-%X%X.png",arc4random(),arc4random()];
    NSString *fullfilename = [homeDirectory stringByAppendingString:randomName];
    
    
    
    ESFVehicle *vehicle = [ESFVehicle new];
    
    vehicle.registration = [@[reg1TextField.text, reg2TextField.text, reg3TextField.text] componentsJoinedByString:nil];
    vehicle.make = [_vehicleModels objectAtIndex:[vehiclePickerView selectedRowInComponent:0]];
    vehicle.color = [colorSegmentedControl titleForSegmentAtIndex:colorSegmentedControl.selectedSegmentIndex];
    vehicle.type = [carTypeSegmentedControl titleForSegmentAtIndex:carTypeSegmentedControl.selectedSegmentIndex];
    vehicle.image = fullfilename;
    if (_locationManager.location != nil){
        vehicle.location = _locationManager.location;
    }   else{
        vehicle.location = [[CLLocation alloc] initWithLatitude:0 longitude:0];
    }
    vehicle.date = [NSDate date];
    
    ESFVehicles *vehiclesList = [ESFVehicles sharedManager];
    [vehiclesList addVehicle:vehicle];
    
    
    [NSKeyedArchiver archiveRootObject:imageData toFile:fullfilename];
    
}
@end
