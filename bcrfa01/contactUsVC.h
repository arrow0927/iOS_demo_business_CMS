//
//  contactUsVC.h
//  bcrfa01
//
//  Created by A M on 11-12-27.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface contactUsVC : UIViewController <MKMapViewDelegate>



@property (weak, nonatomic) IBOutlet MKMapView *contactUSmapView;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;

@end
