//
//  eventsTodayVC.m
//  bcrfa01
//
//  Created by A M on 12-01-04.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "eventsTodayVC.h"

@implementation eventsTodayVC
@synthesize eTodaySegment;
@synthesize eTodayBarButn;
@synthesize eTodayMarView;
@synthesize eTodayTableView;
//=============================================================================
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//=============================================================================
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/
//=============================================================================
- (void)viewDidUnload
{
    [self setETodaySegment:nil];
    [self setETodayBarButn:nil];
    [self setETodayMarView:nil];
    [self setETodayTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
//=============================================================================
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//=============================================================================
#pragma UITableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//=============================================================================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
    
}
//=============================================================================
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"monthEventsCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                      reuseIdentifier:CellIdentifier];
    }
    /*
    switch (indexPath.row)
    {
        case 0:
        {
            
            [cell.textLabel setText:@"Day"];
            [cell.detailTextLabel setText:@"Events for the day"];
            
            // if(events)
            {
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator] ;
            }
            break;
        }
        case 1:
        {
            [cell.textLabel setText:@"Day"];
            [cell.detailTextLabel setText:@"Events for the day"];
            
            // if(events)
            {
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator] ;
            }
            break;
        }
        case 2:
        {
            [cell.textLabel setText:@"Day"];
            [cell.detailTextLabel setText:@"Events for the day"];
            
            // if(events)
            {
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator] ;
            }
            break;
        }
        case 3:
        {
            [cell.textLabel setText:@"Day"];
            [cell.detailTextLabel setText:@"Events for the day"];
            
            // if(events)
            {
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator] ;
            }
            break;
        }
        case 4:
        {
            [cell.textLabel setText:@"Day"];
            [cell.detailTextLabel setText:@"Events for the day"];
            
            // if(events)
            {
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator] ;
            }
            break;
        }
        case 5:
        {
            [cell.textLabel setText:@"Day"];
            [cell.detailTextLabel setText:@"Events for the day"];
            
            // if(events)
            {
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator] ;
            }
            break;
        }
        case 6:
        {
            [cell.textLabel setText:@"Day"];
            [cell.detailTextLabel setText:@"Events for the day"];
            
            // if(events)
            {
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator] ;
            }
            break;
        }
            
            
        default:
            break;
    }
     */
    return cell;
    
}

//=============================================================================
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
{
    NSString *sectionTitle;
    switch (section)
    {
        case 0:
        {
            sectionTitle = [[NSString alloc] initWithString:@"Event 1"];
            break;
        }
        case 1:
        {
            sectionTitle = [[NSString alloc] initWithString:@"Event 2"];
            break;
        }
        case 2:
        {
            sectionTitle = [[NSString alloc] initWithString:@"Event 3"];
            break;
        }
        case 3:
        {
            sectionTitle = [[NSString alloc] initWithString:@"Event 4"];
            break;
        }
        case 4:
        {
            sectionTitle = [[NSString alloc] initWithString:@"Event 5"];
            break;
        }
            
        default:
            break;
    }
    return sectionTitle;
    
}
//=============================================================================
/*
 - (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;   
 - (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath;
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath;
 - (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView;                                                    
 - (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index;
 
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;
 
 // Data manipulation - reorder / moving support
 
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath;
 */

//=============================================================================
#pragma UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected row = %d", indexPath.row);
    
    //[self performSegueWithIdentifier:@"month2weekEventSegue" sender:self];
}
//=============================================================================
/*
 - (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
 
 // Variable height support
 
 - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
 - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
 - (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;
 
 // Section header & footer information. Views are preferred over title should you decide to provide both
 
 - (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;   // custom view for header. will be adjusted to default or specified header height
 - (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;   // custom view for footer. will be adjusted to default or specified footer height
 
 // Accessories (disclosures). 
 
 - (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_NA,__MAC_NA,__IPHONE_2_0,__IPHONE_3_0);
 - (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath;
 
 // Selection
 
 // Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
 - (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath;
 __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);
 // Called after the user changes the selection.
 
 - (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);
 - (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath 
 
 // Editing
 
 // Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
 - (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath;
 - (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);
 
 // Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
 - (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath;
 
 // The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
 - (void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath;
 - (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath;
 
 // Moving/reordering
 
 // Allows customization of the target row for a particular row as it is being moved/reordered
 - (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath;               
 
 // Indentation
 
 - (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath; // return 'depth' of row for hierarchies
 
 // Copy/Paste.  All three methods must be implemented by the delegate.
 
 - (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_5_0);
 - (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_5_0);
 - (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_5_0);
 
 */




@end
