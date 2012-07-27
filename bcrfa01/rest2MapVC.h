//
//  rest2MapVC.h
//  bcrfa01
//
//  Created by A M on 11-12-28.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreData/CoreData.h>
#import "CDCtrlSingleton.h"
#import "locCtrlSingleton.h"
#import "RestaurantMapAnnotation.h"


@interface rest2MapVC : UIViewController <MKMapViewDelegate , NSFetchedResultsControllerDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) locCtrlSingleton *locMgr;
@property (weak, nonatomic) NSArray *mapAnnotationArray;
@property (assign, nonatomic) CLLocationCoordinate2D mapCenterCoordinate;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end
