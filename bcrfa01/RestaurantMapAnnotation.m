//
//  RestaurantMapAnnotation.m
//  bcrfa01
//
//  Created by A M on 12-01-15.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RestaurantMapAnnotation.h"

@implementation RestaurantMapAnnotation

@synthesize title;
@synthesize subtitle;
@synthesize coordinate;

//==============================================================================
-(id)initWithCoordinate:(CLLocationCoordinate2D) c
{
	if (self = [super init])
    {
		coordinate = c;
    }
	return self;
}
//==============================================================================

@end
