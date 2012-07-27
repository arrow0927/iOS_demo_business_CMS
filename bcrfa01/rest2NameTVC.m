//
//  rest2NameTVC.m
//  bcrfa01
//
//  Created by A M on 12-01-14.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "rest2NameTVC.h"



//==============================================================================
@interface  rest2NameTVC ()
-(void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end

//==============================================================================
@implementation rest2NameTVC


@synthesize fetchedResultsController = __fetchedResultsController;
@synthesize managedObjectContext = __managedObjectContext;
#pragma mark - View lifecycle
//==============================================================================
/*
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) 
    {
        // Custom initialization
    }
    return self;
}
*/

//==============================================================================
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


//==============================================================================
- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"%s %d", __FILE__, __LINE__);
    CDCtrlSingleton *coreDataController = [CDCtrlSingleton getSingleton];
    self.managedObjectContext = coreDataController.managedObjectContext;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


//==============================================================================
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


//==============================================================================
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}


//==============================================================================
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return NO;
}


//==============================================================================
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    NSLog(@"%s %d", __FILE__, __LINE__);
    NSInteger i = [[self.fetchedResultsController sections] count];
    NSLog(@"Number of sections in tableView = %d",i );
    return i;

    
    // Return the number of sections.
    //return 1;
}


//==============================================================================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    NSLog(@"%s %d", __FILE__, __LINE__);
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] 
                                                    objectAtIndex:section];
    
    NSInteger i= [sectionInfo numberOfObjects];
    //NSLog(@"Number of rows in section %@ in tableView = %@", section, i );
    return i;
    
    // Return the number of rows in the section.
    //return 10;
}


//==============================================================================
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomCell";
    
    CustomCell *cell = (CustomCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
    {
        
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" 
                                                       owner:nil 
                                                     options:nil];
        for (UIView* view in views)
        {
            if([view isKindOfClass:[CustomCell class]])
            {
                cell = (CustomCell*)view;
            }
        }
    }
    NSManagedObject *managedObject = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    NSLog(@"IndexPath> Section= %d. Row= %d", indexPath.section, indexPath.row);
    
    cell.nameLabel.text = [[managedObject valueForKey:@"name"] description];
    NSLog(@"nameLabel = %@", cell.nameLabel.text);
    cell.cityLabel.text = [[managedObject valueForKey:@"city"] description];
    NSLog(@"citylabel = %@", cell.cityLabel.text);
    cell.cuisineLabel.text = [[managedObject valueForKey:@"cuisine"] description];
    NSLog(@"cuisineLabel = %@", cell.cuisineLabel.text);
    cell.hoursLabel.text = [[managedObject valueForKey:@"closingTime"] description];
    NSLog(@"hoursLabel = %@", cell.hoursLabel.text);
    
    //[self configureCell:cell atIndexPath:indexPath];
    

    return cell;
}
//==============================================================================
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	NSLog(@"The segue identifier is: %@", [segue description] );
    NSLog(@"The segue's identifier is %@", [segue identifier]);
    
    NSLog(@"%s %d", __FILE__, __LINE__);
    if ([segue.identifier isEqualToString:@"name2DetailSegue"])
	{
        NSLog(@"%s %d", __FILE__, __LINE__);
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSManagedObject *selectedObject = [[self fetchedResultsController] 
                                           objectAtIndexPath:indexPath];
        [[segue destinationViewController] setDetailItem:selectedObject];
        
        //UIViewController *restDetailVController = segue.destinationViewController;
        NSLog(@"About to launch ViewController %@", [[segue destinationViewController] description]);
    }
}

//==============================================================================
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


//==============================================================================
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"About to peform segue");
    NSLog(@"%s %d", __FILE__, __LINE__);  
    [self performSegueWithIdentifier:@"name2DetailSegue" sender:self];
}

//==============================================================================
#pragma mark -Fetched Results Controller
- (NSFetchedResultsController *)fetchedResultsController
{
    if (__fetchedResultsController != nil) 
    {
        return __fetchedResultsController;
    }
    NSLog(@"%s %d", __FILE__, __LINE__);
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSLog(@"fetchRequest= %@", [fetchRequest debugDescription] );
    
    NSLog(@"managedObject = %@", [self.managedObjectContext debugDescription] );
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Restaurant" 
                                              inManagedObjectContext:self.managedObjectContext];
    NSLog(@"entity = %@ ", [entity debugDescription]);
    
    [fetchRequest setEntity:entity];
    
    
    [fetchRequest setFetchBatchSize:20];
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"id" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] 
                                                             initWithFetchRequest:fetchRequest 
                                                             managedObjectContext:self.managedObjectContext 
                                                             sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) 
    {
	    /*
	     Replace this implementation with code to handle the error appropriately.
         
	     abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
	     */
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return __fetchedResultsController;
    
}


//==============================================================================
- (void)configureCell:(CustomCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s %d", __FILE__, __LINE__);
    NSManagedObject *managedObject = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.nameLabel.text = [[managedObject valueForKey:@"name"] description];
    cell.cityLabel.text = [[managedObject valueForKey:@"city"] description];
    cell.cuisineLabel.text = [[managedObject valueForKey:@"cuisine"] description];
    cell.hoursLabel.text = [[managedObject valueForKey:@"closingTime"] description];
    
    
    
}




@end
