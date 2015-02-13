//
//  ESFVehicles.h
//  Vehicle Recorder
//
//  Created by Fernando on 12/02/2015.
//  Copyright (c) 2015 Fernando. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESFVehicle.h"

@interface ESFVehicles : NSObject{
    NSMutableArray* vehicleList;
    NSString *fullPathname;
}

@property (nonatomic,retain) NSMutableArray* vehicleList;
@property (nonatomic,retain) NSString* fullPathname;
+ (id)sharedManager;

- (void) addVehicle:(ESFVehicle*)vehicle;

@end
