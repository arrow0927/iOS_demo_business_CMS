//
//  RestaurantObj.h
//  bcrfa01
//
//  Created by A M on 12-01-09.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestaurantObj : NSObject


@property (nonatomic , assign) NSString* ID;
@property (nonatomic, assign) NSString* name;
@property (nonatomic, assign) NSString* address;
@property (nonatomic, assign) NSString* city;
@property (nonatomic, assign) NSString* postalCode;
@property (nonatomic, assign) NSString* cuisine;
@property (nonatomic, assign) NSNumber* latitude;
@property (nonatomic, assign) NSNumber* longitude;
@property (nonatomic, assign) NSString* openingTime;
@property (nonatomic, assign) NSString* closingTime;

-(id)initWithID:(NSString*)_ID 
             name:(NSString*) _name 
          address:(NSString*) _address 
             city:(NSString*) _city
       postalCode:(NSString*)_PostalCode 
           cusine:(NSString*)_cuisine 
         latutude:(NSNumber*)_latitude 
        longitude:(NSNumber*)_longitude 
      openingTime:(NSString*)_openingTime 
      closingTime:(NSString*)_closingTime;

@end
