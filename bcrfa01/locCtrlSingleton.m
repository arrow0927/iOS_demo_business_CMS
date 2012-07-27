//
//  locCtrlSingleton.m
//  bcrfa01
//
//  Created by A M on 12-01-15.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "locCtrlSingleton.h"

@implementation locCtrlSingleton

@synthesize userCoordinate, currentLat, currentLong, locMgr, userLocation, 
defaultLocationIfError, shortestDistance, longestDistance;
//==============================================================================
static locCtrlSingleton *_locCtrlSingleton = NULL;

+(locCtrlSingleton *)getSingleton
{
    if (_locCtrlSingleton !=nil)
    {
		NSLog(@"locCtrlSingleton has already been created.....");
		return _locCtrlSingleton;
    }
	@synchronized(self)
    {
        if (_locCtrlSingleton == nil)
        {
            _locCtrlSingleton = [[self alloc]init];
            NSLog(@"Created a new locCtrlSingleton");
        }
    }
	return _locCtrlSingleton;
}
//==============================================================================
+(id)alloc
{
	@synchronized([locCtrlSingleton class])
    {
        NSLog(@"inside alloc of location model");
        NSAssert(_locCtrlSingleton == nil, @"Attempted to allocate a second instance of a singleton.");
        _locCtrlSingleton = [super alloc];
        return _locCtrlSingleton;
    }
	return nil;
}
//==============================================================================
-(id)init
{
    self = [super init];
    
    if(_locCtrlSingleton != nil)
    {
        [self initLocationManager];        
    }
    return self;
}

//==============================================================================
-(void)updateLocationCoordinates
{
    
}
//==============================================================================
-(id)initWithCoordinate:(CLLocationCoordinate2D)_coordinate
{
    return nil;
}
//==============================================================================
-(void)initLocationManager
{
    
    NSLog(@"Loction Manager initiated");
    self.locMgr = [[CLLocationManager alloc] init];
    self.locMgr.delegate = self;
    self.locMgr.distanceFilter = kCLHeadingFilterNone;
    self.locMgr.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locMgr stopUpdatingLocation];
    NSLog(@"location manager object %@", locMgr);

}
//==============================================================================
# pragma -CLLocationManagerDelegate Methods

-(void)locationManager:(CLLocationManager*)_manager 
   didUpdateToLocation:(CLLocation *)newLocation 
		  fromLocation:(CLLocation *)oldLocation
{
	self.userLocation = newLocation;
	NSLog(@"User location is: %@", self.userLocation);
	NSLog(@"USer location latitude = %.4f", self.userLocation.coordinate.latitude );
	NSLog(@"USer location longitude = %.4f", self.userLocation.coordinate.longitude);
	if (self.userLocation)
    {
		[self.locMgr stopUpdatingLocation];
    }
	//[self calculateShortestDistanceBetweenUserAndBiz:self.userLocation];
	//[self calculateDistanceToBeShownOnMap:self.userLocation];
	
}
//==============================================================================
-(void)locationManager:(CLLocationManager *)_manager didFailWithError:(NSError*)_error
{
	NSString* errorType = (_error.code == kCLErrorDenied) ? @"Access Denied" : @"Unknown Error";
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error getting Location"
													message:errorType
												   delegate:nil
										  cancelButtonTitle:@"OK"
										  otherButtonTitles:nil];
	[alert show];
}
//==============================================================================
-(void)calculateShortestDistanceBetweenUserAndBiz:(CLLocation*)_userLocation
{
    NSLog(@"Entering %s", __FUNCTION__);
	/*
	for(LocationMapAnnotation *tempAnnot in self.mapAnnotations)
    {
		CLLocation *tempLocation = [[CLLocation alloc] initWithLatitude:tempAnnot.coordinate.latitude
															  longitude:tempAnnot.coordinate.longitude];
		NSLog(@"tempLocation created %@ ", tempLocation);
		
		CLLocationDistance tempDistance = [_userLocation distanceFromLocation: tempLocation];
		NSLog(@"tempDistance  was calculated at %.2f", tempDistance);
		if(!self.shortestDistance) 
        {
			self.shortestDistance = tempDistance;
			NSLog(@"Assigned value %.2f to shortestDistance", self.shortestDistance);
			continue;
        }
		if(self.shortestDistance >= tempDistance)
        {
			NSLog(@"Replacing shortest distance value from %.2f to %.2f", self.shortestDistance, tempDistance);
			self.shortestDistance = tempDistance;
        }
		[tempLocation release];
    }
*/
}
//==============================================================================
-(void)calculateDistanceToBeShownOnMap:(CLLocation*)_userLocation
{
    NSLog(@"Entering %s", __FUNCTION__);
	/*
	for(LocationMapAnnotation *tempAnnot in self.mapAnnotations)
    {
		CLLocation *tempLocation = [[CLLocation alloc] initWithLatitude:tempAnnot.coordinate.latitude
															  longitude:tempAnnot.coordinate.longitude];
		NSLog(@"tempLocation created %@ ", tempLocation);
		
		CLLocationDistance tempDistance = [_userLocation distanceFromLocation: tempLocation];
		NSLog(@"userlocation from this tempLocation  was calculated at %.2f meters", tempDistance);
		
		if(!self.longestDistance) 
        {
			self.longestDistance = tempDistance;
			NSLog(@"longest distance was nil, so Assigned value %.2f meters to longestdistance", self.longestDistance);
			continue;
        }
		if(self.longestDistance < tempDistance)
        {
			NSLog(@"longest distance was shorter than tempLocation. Replacing longest distance value from %.2f to %.2f", self.longestDistance, tempDistance);
			self.longestDistance = tempDistance;
        }
		[tempLocation release];
    }
	NSLog(@"Final value of longest value was: %.2f", self.longestDistance);
*/
}
 
@end