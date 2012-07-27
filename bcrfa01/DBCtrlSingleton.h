//
//  DBCtrlSingleton.h
//  bcrfa01
//
//  Created by A M on 12-01-08.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestaurantObj.h"
#import <sqlite3.h>

@interface DBCtrlSingleton : NSObject



@property(nonatomic, copy) NSString *dbName, *dbPath;
@property(nonatomic, retain)NSMutableArray *items;


+(DBCtrlSingleton *) getSingleton;
-(void)checkAndCreateDB:(NSString*)_dbName;
-(void)createRestaurantArrayFromDB;
-(void)printContentsOfArray;

@end
