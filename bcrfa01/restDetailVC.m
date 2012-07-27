//
//  restDetailVC.m
//  bcrfa01
//
//  Created by A M on 11-12-28.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "restDetailVC.h"

@interface  restDetailVC ()
-(void)configureView;

@end



@implementation restDetailVC
@synthesize restImg;
@synthesize Address1;
@synthesize Address2;
@synthesize Address3;
@synthesize telephone;
@synthesize email;
@synthesize url;
@synthesize textView;
@synthesize detailItem = _detailItem;

#pragma mark - View lifecycle
//==============================================================================
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
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
  
    [self setRestImg:nil];
    [self setAddress1:nil];
    [self setAddress2:nil];
    [self setAddress3:nil];
    [self setTelephone:nil];
    [self setEmail:nil];
    [self setUrl:nil];
    [self setTextView:nil];
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
-(void)setDetailItem:(id)newDetailItem
{
    if(_detailItem !=newDetailItem)
    {
        _detailItem = newDetailItem;
        [self configureView];
        
    }
    
}
//==============================================================================
-(void)configureView
{
    if (self.detailItem) 
    {
        self.restImg = nil;
        self.Address1.text = @"Not Yet Set";
        self.Address2.text = @"Not Yet Set";
        self.Address3.text = @"Not Yet Set";
        self.telephone.text = @"Not Yet Set";
        self.email.text = @"Not Yet Set";
        self.url.text = @"Not Yet Set";
        self.textView.text = @"Not Yet Set";
    }
}




@end
