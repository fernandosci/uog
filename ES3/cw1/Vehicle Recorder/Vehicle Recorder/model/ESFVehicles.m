//
//  ESFVehicles.m
//  Vehicle Recorder
//
//  Created by Fernando on 12/02/2015.
//  Copyright (c) 2015 Fernando. All rights reserved.
//

#import "ESFVehicles.h"

@implementation ESFVehicles


@synthesize vehicleList;
@synthesize fullPathname;

+ (id)sharedManager {
    static ESFVehicles *sharedMyESFVehicles = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyESFVehicles = [[self alloc] init];
    });
    return sharedMyESFVehicles;
}

- (id)init {
    if (self = [super init]) {
        
        NSArray *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                 NSUserDomainMask, YES);
        NSString *homeDirectory = [documents objectAtIndex:0];
        
        fullPathname = [homeDirectory stringByAppendingString:@"/vehiclelist.dat" ];
        
        
        vehicleList = [NSKeyedUnarchiver unarchiveObjectWithFile:fullPathname];
        
        if (vehicleList == nil)
        {
            vehicleList = [NSMutableArray new];
        }
    }
    return self;
}

- (void) addVehicle:(ESFVehicle *)vehicle{
    
    [vehicleList addObject:vehicle];
    
    [NSKeyedArchiver archiveRootObject:vehicleList toFile:fullPathname];
}



- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end
