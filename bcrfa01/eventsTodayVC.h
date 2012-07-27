//
//  eventsTodayVC.h
//  bcrfa01
//
//  Created by A M on 12-01-04.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface eventsTodayVC : UIViewController <UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UINavigationItem *eTodaySegment;
@property (weak, nonatomic) IBOutlet UIToolbar *eTodayBarButn;
@property (weak, nonatomic) IBOutlet MKMapView *eTodayMarView;
@property (weak, nonatomic) IBOutlet UITableView *eTodayTableView;

@end
