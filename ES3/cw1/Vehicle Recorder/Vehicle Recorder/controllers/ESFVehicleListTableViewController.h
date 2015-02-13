//
//  ESFVehicleTableViewController.h
//  Vehicle Recorder
//
//  Created by Fernando on 12/02/2015.
//  Copyright (c) 2015 Fernando. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../model/ESFVehicle.h"
#import "../model/ESFVehicles.h"
#import "ESFVehicleDetailsTableController.h"

@interface ESFVehicleListTableViewController : UITableViewController


@property (strong, nonatomic) IBOutlet UITableView *vehicleListTableView;



@end
