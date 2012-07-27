//
//  PageControlRootViewController.h
//  bcrfa01
//
//  Created by A M on 11-12-31.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageControlRootViewController : UIViewController <UIPageViewControllerDelegate>



@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) UIButton* callingButton;

@end
