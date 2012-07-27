//
//  CDCtrlSingleton.m
//  bcrfa01
//
//  Created by A M on 12-01-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
//==============================================================================
#import "CDCtrlSingleton.h"


@implementation CDCtrlSingleton

@synthesize managedObjectContext = __managedObjectContext;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;

//==============================================================================
#pragma mark - Singleton methods

static CDCtrlSingleton *sharedSingleton = nil;

+(CDCtrlSingleton *) getSingleton
{
	if (sharedSingleton !=nil)
    {
		NSLog(@"CDCtrlSingleton has already been created.....");
		return sharedSingleton;
    }
	@synchronized(self)
    {
        if (sharedSingleton == nil)
        {
            sharedSingleton = [[self alloc]init];
            NSLog(@"Created a new CDCtrlSingleton");
        }
    }
	return sharedSingleton;
}
//==============================================================================
+(id)alloc
{
	@synchronized([CDCtrlSingleton class])
    {
        NSLog(@"inside alloc");
        NSAssert(sharedSingleton == nil, @"Attempted to allocate a second instance of a singleton.");
        sharedSingleton = [super alloc];
        return sharedSingleton;
    }
	
	return nil;
}

//==============================================================================
-(id)init
{
    self = [super init];
	if (sharedSingleton != nil ) 
    {
		NSLog(@"inside init for cdSingletonCntrl");
		
    }
	
	return sharedSingleton;
}


//==============================================================================
#pragma mark - Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext
{
    if (__managedObjectContext != nil)
    {
        return __managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil)
    {
        __managedObjectContext = [[NSManagedObjectContext alloc] init];
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return __managedObjectContext;
}
//==============================================================================
/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    if (__managedObjectModel != nil)
    {
        return __managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] 
                       URLForResource:@"bcrfaModel" 
                       withExtension:@"momd"];
    __managedObjectModel = [[NSManagedObjectModel alloc] 
                            initWithContentsOfURL:modelURL];
    return __managedObjectModel;
}
//==============================================================================
/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (__persistentStoreCoordinator != nil)
    {
        return __persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"cdRestaurants.sqlite"];
    
    NSError *error = nil;
    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] 
                                    initWithManagedObjectModel:[self managedObjectModel]];
    
    if (![__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType 
                                                    configuration:nil 
                                                              URL:storeURL 
                                                          options:nil 
                                                            error:&error])
    {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter: 
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return __persistentStoreCoordinator;
}
//==============================================================================
- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}
//==============================================================================
-(void)insertRestaurantIntoCoreData:(RestaurantObj*)_restaurantObj
{
    NSManagedObjectContext *context = self.managedObjectContext;
    
    NSManagedObject *newManagedObject = [NSEntityDescription 
                                         insertNewObjectForEntityForName:@"Restaurant" 
                                         inManagedObjectContext:context];
    
    [newManagedObject setValue:_restaurantObj.ID forKey:@"id"];
    //NSLog(@"Inserted Value: %@ for Key: %@ into ManagedObject", [newManagedObject valueForKey:@"id"], @"id");
    [newManagedObject setValue:_restaurantObj.name forKey:@"name"];
    //NSLog(@"Inserted Value: %@ for Key: %@ into ManagedObject", [newManagedObject valueForKey:@"name"], @"name");
    [newManagedObject setValue:_restaurantObj.address forKey:@"address"];
    //NSLog(@"Inserted Value: %@ for Key: %@ into ManagedObject", [newManagedObject valueForKey:@"address"], @"address");
    [newManagedObject setValue:_restaurantObj.city forKey:@"city"];
    //NSLog(@"Inserted Value: %@ for Key: %@ into ManagedObject", [newManagedObject valueForKey:@"city"], @"city");
    [newManagedObject setValue:_restaurantObj.postalCode forKey:@"postalCode"];
    //NSLog(@"Inserted Value: %@ for Key: %@ into ManagedObject", [newManagedObject valueForKey:@"postalCode"], @"postalCode");
    [newManagedObject setValue:_restaurantObj.cuisine forKey:@"cuisine"];
    //NSLog(@"Inserted Value: %@ for Key: %@ into ManagedObject", [newManagedObject valueForKey:@"cuisine"], @"cuisine");
    [newManagedObject setValue:_restaurantObj.latitude forKey:@"latitude"];
    //NSLog(@"Inserted Value: %@ for Key: %@ into ManagedObject", [newManagedObject valueForKey:@"latitude"], @"latitude");
    [newManagedObject setValue:_restaurantObj.longitude forKey:@"longitude"];
    //NSLog(@"Inserted Value: %@ for Key: %@ into ManagedObject", [newManagedObject valueForKey:@"longitude"], @"longitude");
    [newManagedObject setValue:_restaurantObj.openingTime forKey:@"openingTime"];
    //NSLog(@"Inserted Value: %@ for Key: %@ into ManagedObject", [newManagedObject valueForKey:@"openingTime"], @"openingTime");
    [newManagedObject setValue:_restaurantObj.closingTime forKey:@"closingTime"];
    //NSLog(@"Inserted Value: %@ for Key: %@ into ManagedObject", [newManagedObject valueForKey:@"closingTime"], @"closingTime");

    
    NSError *error = nil;
    if (![context save:&error]) 
    {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}



//==============================================================================
#pragma mark - Application's Documents directory

/**
 Returns the URL to the application's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory 
                                                   inDomains:NSUserDomainMask] lastObject];
}

//==============================================================================









@end
