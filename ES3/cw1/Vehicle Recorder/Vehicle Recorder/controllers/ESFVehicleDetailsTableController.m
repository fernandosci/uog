//
//  ESFVehicleDetailsTableController.m
//  Vehicle Recorder
//
//  Created by Fernando on 13/02/2015.
//  Copyright (c) 2015 Fernando. All rights reserved.
//

#import "ESFVehicleDetailsTableController.h"

@interface ESFVehicleDetailsTableController ()


@end

@implementation ESFVehicleDetailsTableController

@synthesize tableCellImage;



- (void) setVehicle:(ESFVehicle*)vehicle{
    _vehicle = vehicle;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   // Return the number of rows in the section.
    if (section == 0)
        return 6;
    else
        return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    
    // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IDDetail" forIndexPath:indexPath];
    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] init];
//    }
    if (indexPath.section == 0)
    {
        
        
        switch (indexPath.row) {
            case 0:{
                cell = _tableCellInfo1;
                cell.textLabel.text = @"Registration";
                cell.detailTextLabel.text = _vehicle.registration;
                break;
            }
            case 1:{
                cell = _tableCellInfo2;
                cell.textLabel.text = @"Manufacturer";
                cell.detailTextLabel.text = _vehicle.make;
                break;
            }
            case 2:{
                cell = _tableCellInfo3;
                cell.textLabel.text = @"Color";
                cell.detailTextLabel.text = _vehicle.color;
                break;
            }
            case 3:{
                cell = _tableCellInfo4;
                cell.textLabel.text = @"Type";
                cell.detailTextLabel.text = _vehicle.type;
                break;
            }
                
            case 4:{
                cell = _tableCellInfo5;
                cell.textLabel.text = @"Location";
                cell.detailTextLabel.text = _vehicle.location.description;
                break;
            }
            case 5:{
                cell = _tableCellInfo6;
                cell.textLabel.text = @"Date";
                cell.detailTextLabel.text = _vehicle.date.description;
                break;
            }
                
                
        }
    }
    else if (indexPath.section == 1)
    {
        cell = tableCellImage;
        
        
        NSData *retrievedData = [NSKeyedUnarchiver unarchiveObjectWithFile:_vehicle.image];
        UIImage * image = [UIImage imageWithData:retrievedData];
        
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        
        
        //UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, image.size.height)];
       // imv.image= image;
        //[cell.contentView addSubview:imv];
        //[cell addSubview:imv];
        
        _tableCellImageView.image = image;
        //cell.imageView.image = image;
    }
   
   
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)tocell = [tableView dequeueReusableCellWithIdentifier:@"VehicleDetail" forIndexPath:indexPath];IndexPath {
}
*/

/*
 
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
