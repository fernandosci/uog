//
//  ESFVehicleItem.m
//  Vehicle Recorder
//
//  Created by Fernando on 12/02/2015.
//  Copyright (c) 2015 Fernando. All rights reserved.
//

#import "ESFVehicle.h"

@implementation ESFVehicle

@synthesize registration = _registration;

@synthesize make = _make;

@synthesize color = _color;

@synthesize type = _type;

@synthesize image = _image;

@synthesize location = _location;

@synthesize date = _date;

- (ESFVehicle*) initWithRegistration:(NSString*)registration
                        manufacturer:(NSString*)make
                               color:(NSString*)color
                                type:(NSString*)type
                             picture:(NSString*)image
                            location:(CLLocation*)location
                                date:(NSDate*)date {
    
    
    if (self = [super init])
    {
        self.registration = registration;
        self.make = make;
        self.color = color;
        self.type = type;
        self.image = image;
        self.location = location;
        self.date = date;

    }
    return self;
    
}

#pragma mark NScoding
#define kRegistrationKey @"Registration"
#define kManufacturerKey @"Make"
#define kColorKey @"Color"
#define kTypeKey @"Type"
#define kImageKey @"Image"
#define kLocationKey @"Location"
#define kDateKey @"Date"


- (id)initWithCoder:(NSCoder *)decoder{
    if (self = [super init])
    {
        self.registration = [decoder decodeObjectForKey:kRegistrationKey];
        self.make = [decoder decodeObjectForKey:kManufacturerKey];
        self.color = [decoder decodeObjectForKey:kColorKey];
        self.type = [decoder decodeObjectForKey:kTypeKey];
        self.image = [decoder decodeObjectForKey:kImageKey];
        self.location = [decoder decodeObjectForKey:kLocationKey];
        self.date = [decoder decodeObjectForKey:kDateKey];
        
    }
    return self;
    
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:_registration forKey:kRegistrationKey];
    [encoder encodeObject:_make forKey:kManufacturerKey];
    [encoder encodeObject:_color forKey:kColorKey];
    [encoder encodeObject:_type forKey:kTypeKey];
    [encoder encodeObject:_image forKey:kImageKey];
    [encoder encodeObject:_location forKey:kLocationKey];
    [encoder encodeObject:_date forKey:kDateKey];
}

@end
