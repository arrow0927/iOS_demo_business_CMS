//
//  webJoinVC.m
//  bcrfa01
//
//  Created by A M on 12-01-06.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "webJoinVC.h"

@implementation webJoinVC
@synthesize activityIndicator;
@synthesize joinWebView;

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
//==============================================================================

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *webURL = [[NSURL alloc] initWithString:@"http://www.bcrfa.com/membership/become-a-member/"];
    NSURLRequest* request = [NSURLRequest requestWithURL:webURL];
    self.joinWebView.scalesPageToFit = YES;
    
    [self.joinWebView loadRequest:request];
}

//==============================================================================
- (void)viewDidUnload
{
    [self setActivityIndicator:nil];
    [self setJoinWebView:nil];
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
#pragma UIWebViewDelegate Methods
/*
- (BOOL)webView:(UIWebView *)webView 
shouldStartLoadWithRequest:(NSURLRequest *)request 
 navigationType:(UIWebViewNavigationType)navigationType
{
    
}
 */
//==============================================================================
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog (@"webViewDidStartLoad");
    //[activityIndicator startAnimating];
}
//==============================================================================
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog (@"webViewDidFinishLoad");
    [activityIndicator stopAnimating];
    [activityIndicator hidesWhenStopped];
}
//==============================================================================
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
    [activityIndicator stopAnimating];
    [activityIndicator hidesWhenStopped];
    if (error != NULL) 
    {
        UIAlertView *errorAlert = [[UIAlertView alloc]
                                   initWithTitle: [error localizedDescription]
                                   message: [error localizedFailureReason]
                                   delegate:nil
                                   cancelButtonTitle:@"OK" 
                                   otherButtonTitles:nil];
        [errorAlert show];
        
    }
}








@end
