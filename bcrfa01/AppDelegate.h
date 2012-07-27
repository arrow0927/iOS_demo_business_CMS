//
//  AppDelegate.h
//  bcrfa01
//
//  Created by A M on 11-12-20.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBController.h"
#import "CDCtrlSingleton.h"
#import "locCtrlSingleton.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>



@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CDCtrlSingleton *coreDataController;
@property (strong, nonatomic) DBController * dbController;
@property (strong, nonatomic) locCtrlSingleton * locationController;

@end
