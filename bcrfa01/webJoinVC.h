//
//  webJoinVC.h
//  bcrfa01
//
//  Created by A M on 12-01-06.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webJoinVC : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIWebView *joinWebView;


@end
