//
//  memDetailsTVC.h
//  bcrfa01
//
//  Created by A M on 12-01-06.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface memDetailsTVC : UITableViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *joinButton;



-(IBAction)launchWebJoinVC:(id)sender;

@end
