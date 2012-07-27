//
//  RestaurantObj.m
//  bcrfa01
//
//  Created by A M on 12-01-09.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RestaurantObj.h"

@implementation RestaurantObj

@synthesize ID, name, address, city, postalCode, cuisine, latitude, longitude, openingTime, closingTime;


//method to initiate the object=================================================
-(id)initWithID:(NSString*)_ID 
             name:(NSString*) _name 
          address:(NSString*) _address 
             city:(NSString*) _city
       postalCode:(NSString*)_PostalCode 
           cusine:(NSString*)_cuisine 
         latutude:(NSNumber*)_latitude 
        longitude:(NSNumber*)_longitude 
      openingTime:(NSString*)_openingTime 
      closingTime:(NSString*)_closingTime
{
    self.ID = _ID;
    self.name = _name;
    self.address = _address;
    self.city = _city;
    self.postalCode = _PostalCode;
    self.cuisine = _cuisine;
    self.latitude = _latitude;
    self.longitude = _longitude;
    self.openingTime = _openingTime;
    self.closingTime = _closingTime;
    //NSLog(@"New Restaurant opbject created with items: id:%@, name:%@,address:%@,city:%@, postalCode:%@, cuisine:%@, latitude:%@, longitude:%@, openingTime:%@, closingTime:%@", self.ID, self.name, self.address, self.city, self.postalCode, self.cuisine, self.latitude, self.longitude, self.openingTime, self.closingTime);

    return self;
}

@end
