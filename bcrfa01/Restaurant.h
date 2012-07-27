//
//  Restaurant.h
//  bcrfa01
//
//  Created by A M on 12-01-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Restaurant : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * closingTime;
@property (nonatomic, retain) NSString * cuisine;
@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSDecimalNumber * latitude;
@property (nonatomic, retain) NSDecimalNumber * longitude;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * openingTime;
@property (nonatomic, retain) NSString * postalCode;

@end
