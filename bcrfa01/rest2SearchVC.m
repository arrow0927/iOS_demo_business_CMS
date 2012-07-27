//
//  rest2SearchVC.m
//  bcrfa01
//
//  Created by A M on 11-12-28.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "rest2SearchVC.h"

@implementation rest2SearchVC
@synthesize searchResultsTable;
@synthesize searchBar;

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
//==============================================================================
- (void)viewDidUnload
{
    [self setSearchResultsTable:nil];
    [self setSearchBar:nil];
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"search2DetailSegue" sender:self];
    /*
    UIStoryboard *sboard = [UIStoryboard storyboardWithName:@"iPhone" bundle:nil];
    UIViewController *restDetailVC = [sboard instantiateViewControllerWithIdentifier:@"restDetailVC"];
    [self.navigationController pushViewController:restDetailVC animated:YES];
     */
    
    
}
//==============================================================================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//==============================================================================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
//==============================================================================
  
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Rest2SearchTVCCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
        // Configure the cell...
    
    return cell;

}

@end
