//
//  DBController.m
//  bcrfa01
//
//  Created by A M on 12-01-10.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DBController.h"

@interface DBController ()

-(void)checkAndCreateDB;
-(void)createArrayFromDB;

@end

@implementation DBController

@synthesize dbName, dbPath;
@synthesize items;


//==============================================================================
-(id)initWithDB:(NSString*)_dbName 
{
    self = [super init];
	if (self) 
    {
        self.dbName = _dbName;
        self.dbPath = nil;
        self.items = nil;
        
		NSLog(@"inside init for DBCtrl");
        NSLog(@"dbName %@", self.dbName);
        
        
        [self checkAndCreateDB];
        [self createArrayFromDB];
		
    }
	
	return self;
}

//==============================================================================
-(void)printContentsOfArray
{

    for(RestaurantObj *rObj in self.items)
    {
        NSLog(@"**");
        NSLog(@"Restaurant #%@", rObj.ID);
        NSLog(@"name:%@", rObj.name);
        NSLog(@"address:%@", rObj.address);
        NSLog(@"city:%@", rObj.city);
        NSLog(@"postalCode:%@", rObj.postalCode);
        NSLog(@"cuisine:%@", rObj.cuisine);
        NSLog(@"latitude:%@", rObj.latitude);
        NSLog(@"longitude:%@", rObj.longitude);
        NSLog(@"openingTime:%@", rObj.openingTime);
        NSLog(@"closingTime:%@", rObj.closingTime);
        NSLog(@"**");
    }

}
//==============================================================================
-(void)checkAndCreateDB
{
    
    NSLog(@"This DBController will create a DB for %@", self.dbName);
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
                                                                 NSUserDomainMask, YES);
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    self.dbPath = [documentsDir stringByAppendingPathComponent:self.dbName];
    NSLog(@"Path to DB is %@",self.dbPath);
    BOOL success;
    NSFileManager *fMgr = [NSFileManager defaultManager];
    success = [fMgr fileExistsAtPath:self.dbPath];
    if (success)
    {
        NSLog(@"DB file exists in documents folder");
        return;
    }
    //If file did not exist in documents directory get it from the main bundle
    NSLog(@"DB file did not exist in documents folder");
    NSString *dbPathFromApp = [[[NSBundle mainBundle] resourcePath] 
                               stringByAppendingPathComponent:self.dbName];
    [fMgr copyItemAtPath:dbPathFromApp toPath:self.dbPath error:nil];
    NSLog(@"Copied DB from %@ into documents folder%@",dbPathFromApp,self.dbPath);
}
//==============================================================================
-(void)createArrayFromDB
{
    NSLog(@"%s %d", __FILE__, __LINE__);
    sqlite3 *database;
    self.items = [[NSMutableArray alloc] initWithCapacity:3000];
    
    if(sqlite3_open([self.dbPath UTF8String], &database) == SQLITE_OK)
    {
        const char *sqlStatement = "select * from Restaurants";
        sqlite3_stmt *compiledStmt;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStmt, NULL) == SQLITE_OK)
        {
            NSLog(@"About to enter loop to read DB......");
            while(sqlite3_step(compiledStmt) ==SQLITE_ROW)
            {
                
                NSMutableString *rID = [NSString stringWithUTF8String:(char*) 
                                        sqlite3_column_text(compiledStmt, 0)];
                //NSLog(@"rID = %@", rID);
                NSMutableString *rName = [NSString stringWithUTF8String:(char*) 
                                          sqlite3_column_text(compiledStmt, 1)];
                //NSLog(@"rID = %@", rName);
                NSMutableString *rAddress = [NSString stringWithUTF8String:(char*) 
                                             sqlite3_column_text(compiledStmt, 2)];
                //NSLog(@"rID = %@", rAddress);
                NSMutableString *rCity = [NSString stringWithUTF8String:(char*) 
                                          sqlite3_column_text(compiledStmt, 3)];
                //NSLog(@"rID = %@", rCity);
                NSMutableString *rPostalCode = [NSString stringWithUTF8String:(char*) 
                                                sqlite3_column_text(compiledStmt, 4)];
                //NSLog(@"rID = %@", rPostalCode);
                NSMutableString *rCuisine = [NSString stringWithUTF8String:(char*) 
                                             sqlite3_column_text(compiledStmt, 5)];
                //NSLog(@"rID = %@", rCuisine);
                NSNumber *rLatitude =  [NSNumber numberWithFloat: (float) sqlite3_column_double(compiledStmt, 6)];
                //NSLog(@"rID = %@", rLatitude);
                NSNumber *rLongitude =  [NSNumber numberWithFloat: (float) sqlite3_column_double(compiledStmt, 7)];
                //NSLog(@"rID = %@", rLongitude);
                NSMutableString *rOpeningTime = [NSString stringWithUTF8String:(char*) 
                                                 sqlite3_column_text(compiledStmt, 8)];
                //NSLog(@"rID = %@", rOpeningTime);
                NSMutableString *rClosingTime = [NSString stringWithUTF8String:(char*) 
                                                 sqlite3_column_text(compiledStmt, 9)];
                //NSLog(@"rID = %@", rClosingTime);
                RestaurantObj *rObj = [[RestaurantObj alloc] initWithID:rID name:rName address:rAddress city:rCity postalCode:rPostalCode cusine:rCuisine latutude:rLatitude longitude:rLongitude openingTime:rOpeningTime closingTime:rClosingTime];
                [self.items addObject:rObj];
                
            }
            NSLog(@"done reading DB......");        }
        
        sqlite3_finalize(compiledStmt);
    }
    
    

}
@end
