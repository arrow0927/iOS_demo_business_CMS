//
//  rest2MapVC.m
//  bcrfa01
//
//  Created by A M on 11-12-28.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "rest2MapVC.h"

@implementation rest2MapVC
@synthesize mapView;

@synthesize locMgr;;
@synthesize mapAnnotationArray;
@synthesize mapCenterCoordinate;
@synthesize fetchedResultsController;
@synthesize managedObjectContext;


#pragma mark - View lifecycle
//==============================================================================
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//==============================================================================
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
//==============================================================================
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.locMgr = [locCtrlSingleton getSingleton];
    CDCtrlSingleton *coreDataController = [CDCtrlSingleton getSingleton];
    self.managedObjectContext = coreDataController.managedObjectContext;
    
}
//==============================================================================
/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/
//==============================================================================
- (void)viewDidLoad
{
    [super viewDidLoad];
    //Set up the mapview
    [self.mapView setMapType:MKMapTypeStandard];
    [self.mapView setZoomEnabled:YES];
	[self.mapView setScrollEnabled:YES];
    ///get customer coordinates
    NSLog(@"*******User's latitude is: %@", [[NSString alloc] initWithFormat:@"%g", self.locMgr.userCoordinate.latitude]);
	NSLog(@"*******User's longitude is: %@", [[NSString alloc] initWithFormat:@"%g", self.locMgr.userCoordinate.longitude]);    
    
    if ((!self.locMgr.userCoordinate.latitude) || (self.locMgr.userCoordinate.latitude == 0) || (!self.locMgr.userCoordinate.longitude)  || (self.locMgr.userCoordinate.longitude == 0))
	{
        //self.mapCenterCoordinate = self.locModel.defaultLocationIfError.coordinate;
        //These are Vancouver coordinates:
        self.mapCenterCoordinate = CLLocationCoordinate2DMake(49.13, 123.06);
    }
    //CoreData Stuff
    //  NSManagedObject *manObject  = [self.fetchedResultsController ]
    
    
}
//==============================================================================
-(void)setDefaultLocation:(NSMutableArray*) mapAnnotationArray
{
    /*
	LocationMapAnnotation *tempAnnot = [mapAnnotationArray objectAtIndex:0];
	self.defaultLocationIfError = [[CLLocation alloc] 
                                   initWithLatitude:tempAnnot.coordinate.latitude 
                                   longitude:tempAnnot.coordinate.longitude];
     */
}
//==============================================================================
- (void)viewDidUnload
{
    [self setMapView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
//==============================================================================
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
//==============================================================================
/*
#pragma - mark location
-(void)setLocation:(CLLocationCoordinate2D)_newLocation
{
    
}

*/



@end
