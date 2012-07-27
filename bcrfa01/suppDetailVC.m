//
//  suppDetailVC.m
//  bcrfa01
//
//  Created by A M on 11-12-30.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "suppDetailVC.h"

@implementation suppDetailVC
@synthesize suppImg;
@synthesize suppAdd1;
@synthesize suppAdd2;
@synthesize suppAdd3;
@synthesize suppTel;
@synthesize suppEmail;
@synthesize suppURL;
@synthesize suppText;


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
    [self setSuppImg:nil];
    [self setSuppAdd1:nil];
    [self setSuppAdd2:nil];
    [self setSuppAdd3:nil];
    [self setSuppTel:nil];
    [self setSuppEmail:nil];
    [self setSuppURL:nil];
    [self setSuppText:nil];
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
