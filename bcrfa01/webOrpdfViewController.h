//
//  webOrpdfViewController.h
//  bcrfa01
//
//  Created by A M on 11-12-31.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webOrpdfViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webOrpdfView;
@property (strong, nonatomic) id dataObject;



@end
