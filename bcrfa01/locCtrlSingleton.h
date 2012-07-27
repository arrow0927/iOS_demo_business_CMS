//
//  locCtrlSingleton.h
//  bcrfa01
//
//  Created by A M on 12-01-15.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>



@interface locCtrlSingleton : NSObject <CLLocationManagerDelegate>


@property (readwrite, nonatomic) CLLocationCoordinate2D userCoordinate;
@property (readwrite, nonatomic) CLLocationDistance shortestDistance;
@property (readwrite, nonatomic) CLLocationDistance longestDistance;

@property (weak, nonatomic) CLLocation *defaultLocationIfError;
@property (weak, nonatomic) CLLocation *userLocation;
@property (weak, nonatomic) NSMutableString *currentLat;
@property (weak, nonatomic) NSMutableString *currentLong;
@property (weak, nonatomic) CLLocationManager *locMgr;

//==============================================================================
+(locCtrlSingleton *)getSingleton;

-(void)updateLocationCoordinates;
-(id)initWithCoordinate:(CLLocationCoordinate2D)_coordinate;
-(void)initLocationManager;
-(void)calculateShortestDistanceBetweenUserAndBiz:(CLLocation*)_userLocation;
-(void)calculateDistanceToBeShownOnMap:(CLLocation*)_userLocation;


//==============================================================================
@end
