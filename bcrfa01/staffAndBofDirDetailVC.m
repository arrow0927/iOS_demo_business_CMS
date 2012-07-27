//
//  staffAndBofDirDetailVC.m
//  bcrfa01
//
//  Created by A M on 12-01-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "staffAndBofDirDetailVC.h"

@implementation staffAndBofDirDetailVC
@synthesize detailImage;
@synthesize address1;
@synthesize address2;
@synthesize address3;
@synthesize tel;
@synthesize email;
@synthesize descriptionText;
@synthesize indexPath = _indexPath;
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
//==============================================================================
- (void)viewDidUnload
{
    [self setDetailImage:nil];
    [self setAddress1:nil];
    [self setAddress2:nil];
    [self setAddress3:nil];
    [self setTel:nil];
    [self setEmail:nil];
    [self setDescriptionText:nil];
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
@end
