//
//  eventsRootTVC.m
//  bcrfa01
//
//  Created by A M on 12-01-06.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "eventsRootTVC.h"


@implementation eventsRootTVC
//==============================================================================
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

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
//==============================================================================
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
//==============================================================================
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
//==============================================================================
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
//==============================================================================
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
//==============================================================================
#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
{
    NSString *sectionTitle;
    switch (section)
    {
        case 0:
        {
            sectionTitle = [[NSString alloc] initWithString:@"Week 1"];
            break;
        }
        case 1:
        {
            sectionTitle = [[NSString alloc] initWithString:@"Week 2"];
            break;
        }
        case 2:
        {
            sectionTitle = [[NSString alloc] initWithString:@"Week 3"];
            break;
        }
        case 3:
        {
            sectionTitle = [[NSString alloc] initWithString:@"Week 4"];
            break;
        }
        case 4:
        {
            sectionTitle = [[NSString alloc] initWithString:@"Week 5"];
            break;
        }
            
        default:
            break;
    }
    return sectionTitle;
    
}
//=============================================================================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 5;
}
//==============================================================================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return 7;
}
//==============================================================================
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"monthEventsCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                      reuseIdentifier:CellIdentifier];
    }
    
    [cell.textLabel setText:@"Day"];
    [cell.detailTextLabel setText:@"Events for the day"];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator] ;
    // Configure the cell...
    
    return cell;
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
    [self performSegueWithIdentifier:@"eventDetailSegue" sender:self ];
    
}
//==============================================================================
@end
