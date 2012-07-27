//
//  CDCtrlSingleton.h
//  bcrfa01
//
//  Created by A M on 12-01-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
/*
 Funtions of this class:
 # CoreData Stack Methods
 #Check upon initialization that the CoreDatSQL lite Database exists
    ifNot-> Create one using the DBController
 
 
 */
//==============================================================================
#import <Foundation/Foundation.h>
#import "RestaurantObj.h"

@interface CDCtrlSingleton : NSObject 


@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
//==============================================================================
+(CDCtrlSingleton *) getSingleton;



- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
//This method only for debug purposes
//-(void)insertRestaurantIntoCoreData:(RestaurantObj*)_restaurantObj;

//==============================================================================
@end
