//
//  rest2NameTVC.h
//  bcrfa01
//
//  Created by A M on 12-01-14.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "CustomCell.h"
#import "CDCtrlSingleton.h"
#import "restDetailVC.h"


@interface rest2NameTVC : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;




@end
