//
//  AboutBcrfaRootVC.m
//  bcrfa01
//
//  Created by A M on 11-12-20.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AboutBcrfaRootVC.h"
#import "rest1TVC.h"
#import "supp1TVC.h"
#import "staffDirTVC.h"
#import "bofDirTVC.h"
#import "contactUsVC.h"


@implementation AboutBcrfaRootVC
@synthesize bcrfaBtn;
@synthesize bmcBtn;
@synthesize AboutTableView;

 //==============================================================================================
#pragma mark - View lifecycle

- (void)viewDidUnload
{
    [self setBcrfaBtn:nil];
    [self setBmcBtn:nil];
    [self setAboutTableView:nil];
    [super viewDidUnload];
        // Release any retained subviews of the main view.
        // e.g. self.myOutlet = nil;
}
//==============================================================================================
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
        // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
    //==============================================================================================
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
            // Custom initialization
    }
    return self;
}
    //==============================================================================================
- (void)didReceiveMemoryWarning
{
        // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
        // Release any cached data, images, etc that aren't in use.
}
    //==============================================================================================
 - (void)viewDidLoad
 {
     [super viewDidLoad];
     UIBarButtonItem *backbutton = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                    style:UIBarButtonItemStyleBordered
                                    target:nil
                                    action:nil];
     self.navigationItem.backBarButtonItem = backbutton;
 }
   //==============================================================================================
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Ask mapview to display the location of the person and the 
    if([segue.identifier isEqualToString:@"tab0ContactSegue"])
    {
        NSLog(@"Segueing into the Map View and Contact Us view controller");
            //[segue.destinationViewController ];
    }
    
}



//==============================================================================================
#pragma mark -
#pragma mark AboutTableViewDelegateMethods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected Cell at Section=%d and Row=%d", indexPath.section, indexPath.row);
      
   
    switch (indexPath.row)
    {
        case 0:
        {
            NSLog(@"About to launch restaurant View Controller");
            [self performSegueWithIdentifier:@"tab0Rest1Segue" sender:self];
            break;
        }
        case 1:
        {
            NSLog(@"About to launch supplier View Controller");  
            [self performSegueWithIdentifier:@"tab0Supp1Segue" sender:self];
            break;
        }
        case 2:
        {
            NSLog(@"About to launch Staff View Controller");
            [self performSegueWithIdentifier:@"tab0StaffDirSegue" sender:self];
            break;
        }
        case 3:
        {
            NSLog(@"About to launch Bof Dir View Controller");
            [self performSegueWithIdentifier:@"tab0BofDirSegue" sender:self];
            break;
        }
        case 4:
        {
            NSLog(@"About to launch Contact Us View Controller");
            [self performSegueWithIdentifier:@"tab0ContactSegue" sender:self];
            break;
        }
        default:
            break;
    }

    
    
    
    
}
//==============================================================================================
/*  
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section; 
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section; 
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath;
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath;               
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath; // return 'depth' of row for hierarchies
- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_5_0);
- (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_5_0);
- (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_5_0);
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath 

*/

//==============================================================================================
#pragma mark -
#pragma mark AboutTableViewDataSourceMethods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;        
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    switch (indexPath.row) 
    {
        case 0:
        {
            cell.textLabel.text = @"Restaurants";
            
            break;
        }
        case 1:
        {
            cell.textLabel.text = @"Suppliers";
            
            break;
        }
        case 2:
        {
            cell.textLabel.text = @"Staff";            
            
            break;
        }
        case 3:
        {
            cell.textLabel.text = @"Board of Directors";
            
            break;
        }
        case 4:
        {
            cell.textLabel.text = @"Contact Us";
            
            break;
        }
        default:
        {
            
            break;
        }
    }
    
    [cell.textLabel setTextAlignment:UITextAlignmentCenter]; 
    [cell.textLabel setTextColor:[UIColor darkGrayColor]];
    return cell;
            
}


/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;  
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath;
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView;                                                    
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index;  
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath;
*/


//==============================================================================================
@end
