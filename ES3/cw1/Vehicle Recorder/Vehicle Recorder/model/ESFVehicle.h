//
//  ESFVehicleItem.h
//  Vehicle Recorder
//
//  Created by Fernando on 12/02/2015.
//  Copyright (c) 2015 Fernando. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ESFVehicle : NSObject <NSCoding>

@property (copy) NSString *registration;

@property (copy) NSString *make;

@property (copy) NSString *color;

@property (copy) NSString *type;

@property (copy) NSString *image;

@property (copy) CLLocation *location;

@property (copy) NSDate *date;


- (ESFVehicle*) initWithRegistration:(NSString*)registration
                    manufacturer:(NSString*)make
                           color:(NSString*)color
                            type:(NSString*)type
                         picture:(NSString*)image
                        location:(CLLocation*)location
                            date:(NSDate*)date;

- (id)initWithCoder:(NSCoder *)decoder;

- (void)encodeWithCoder:(NSCoder *)encoder;
@end
