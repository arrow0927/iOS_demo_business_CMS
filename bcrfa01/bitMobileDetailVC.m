//
//  bitMobileDetailVC.m
//  bcrfa01
//
//  Created by A M on 11-12-21.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "bitMobileDetailVC.h"

@implementation bitMobileDetailVC
@synthesize bmcImg;
@synthesize bmcLabel1;
@synthesize bmcLabel2;
@synthesize bmcLabel3;
@synthesize bmcTextView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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

- (void)viewDidUnload
{
    [self setBmcImg:nil];
    [self setBmcLabel1:nil];
    [self setBmcLabel2:nil];
    [self setBmcLabel3:nil];
    [self setBmcTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
