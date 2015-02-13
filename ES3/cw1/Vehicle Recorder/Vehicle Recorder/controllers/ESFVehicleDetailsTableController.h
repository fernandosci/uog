//
//  ESFVehicleDetailsTableController.h
//  Vehicle Recorder
//
//  Created by Fernando on 13/02/2015.
//  Copyright (c) 2015 Fernando. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../model/ESFVehicle.h"
#import "../model/ESFVehicles.h"

@interface ESFVehicleDetailsTableController : UITableViewController{

    ESFVehicle* _vehicle;
}

- (void) setVehicle:(ESFVehicle*)vehicle;



@property (weak, nonatomic) IBOutlet UITableViewCell *tableCellImage;


@property (weak, nonatomic) IBOutlet UITableViewCell *tableCellInfo1;
@property (weak, nonatomic) IBOutlet UITableViewCell *tableCellInfo2;
@property (weak, nonatomic) IBOutlet UITableViewCell *tableCellInfo3;
@property (weak, nonatomic) IBOutlet UITableViewCell *tableCellInfo4;
@property (weak, nonatomic) IBOutlet UITableViewCell *tableCellInfo5;
@property (weak, nonatomic) IBOutlet UITableViewCell *tableCellInfo6;



@end
