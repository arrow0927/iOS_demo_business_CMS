//
//  magazineRootVC.m
//  bcrfa01
//
//  Created by A M on 11-12-20.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "magazineRootVC.h"
#import "PageControlRootViewController.h"

@implementation magazineRootVC
@synthesize button0;
@synthesize button1;



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
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%s %d %s", __FILE__, __LINE__, __PRETTY_FUNCTION__);
    if([[segue identifier]isEqualToString:@"magButtonPressed"])
    {
        PageControlRootViewController *destVC = [segue destinationViewController];
        destVC.hidesBottomBarWhenPushed = YES;
        destVC.callingButton = (UIButton*)sender;
        NSLog(@"%s %d %s", __FILE__, __LINE__, __PRETTY_FUNCTION__);
    }
    
}
//==============================================================================
-(IBAction)magazineButtonPressed:(UIButton*)Button
{

    NSLog(@"MAgazineRootVC says Button pressed had a tag of %d ", [Button tag]);
    [self performSegueWithIdentifier:@"magButtonPressed" sender:Button];
}


//==============================================================================
#pragma mark - View lifecycle
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *backbutton = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:nil
                                                                  action:nil];
    self.navigationItem.backBarButtonItem = backbutton;
    

}

//==============================================================================
- (void)viewDidUnload
{
    
    [self setButton0:nil];
    [self setButton1:nil];
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
