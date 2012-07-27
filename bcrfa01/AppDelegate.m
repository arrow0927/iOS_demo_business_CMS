//
//  AppDelegate.m
//  bcrfa01
//
//  Created by A M on 11-12-20.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"




@implementation AppDelegate

@synthesize window = _window;
@synthesize coreDataController = _coreDataController;
@synthesize dbController = _dbController;
@synthesize locationController = _locationController;

//==============================================================================
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //- 1- Instantiate CDCtrlSingleton
    self.coreDataController = [CDCtrlSingleton getSingleton];
    self.locationController = [locCtrlSingleton getSingleton];
    //- 2- Check Documents folder - if CDRestaurants.sqllite doesn't exist, 
        //TO DO
    
    //we need to create CoreData SQL database - By instantiating the DBController
    //self.dbController = [[DBController alloc] initWithDB:@"Restaurants.sqlite"];
    
    //- 3 - invoke CDCtrlSingleton's method to create an CDRestaurants.sqllite
    /*
    for(RestaurantObj *restObj in self.dbController.items)
    {
        [self.coreDataController insertRestaurantIntoCoreData:restObj];
    }
    */
        
    //- 4 - Once CDRestaurants.sqlite file is created then we can proceed with the rest of the app
    
    
        
    return YES;
}
//==============================================================================							
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}
//==============================================================================
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}
//==============================================================================
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}
//==============================================================================
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}
//==============================================================================
- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
    
    [self.coreDataController saveContext];
    
    
    
    
}

@end
